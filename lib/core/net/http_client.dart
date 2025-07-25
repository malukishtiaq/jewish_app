import 'dart:io';

import 'package:jewish_app/core/common/extensions/logger_extension.dart';
import 'package:jewish_app/core/common/local_storage.dart';
import 'package:jewish_app/core/common/utils/utils.dart';
import 'package:jewish_app/core/providers/session_data.dart';
import 'package:jewish_app/di/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:jewish_app/localization/app_localization.dart';

import '../common/app_config.dart';
import '../constants/enums/error_code_type.dart';
import '../constants/enums/http_method.dart';
import '../errors/app_errors.dart';
import '../errors/error_global_handler/error_response.dart';
import '../models/base_model.dart';
import 'api_url.dart';
import 'interceptor.dart';
import 'models_factory.dart';
import 'response_validators/response_validator.dart';

@lazySingleton
class HttpClient {
  late Dio _client;

  Dio get instance => _client;

  HttpClient() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(minutes: 2),
      responseType: ResponseType.json,
      baseUrl: APIUrls.baseUrl,
      // contentType: 'application/json',
    );
    _client = Dio(options);

    /// For logger
    if (AppConfig().appOptions.enableDioPrinting) {
      _client.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
        ),
      );
    }
  }

  Future<Either<AppErrors, T>> sendRequest<T extends BaseModel>({
    required HttpMethod method,
    required String url,
    required ResponseValidator responseValidator,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    String? baseUrl,
    bool isFormData = false,
  }) async {
    if (baseUrl != null) {
      _client.options.baseUrl = baseUrl;
    } else {
      _client.options.baseUrl = APIUrls.baseUrl;
    }

    // Get the response from the server
    Response response;
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await _client.get(
            url,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.POST:
          response = await _client.post(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PUT:
          response = await _client.put(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await _client.delete(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PATCH:
          response = await _client.patch(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }
      // Get the decoded json
      /// json response like this
      /// {"data":"our data",
      /// "succeed":true of false,
      /// "message":"message if there is error"}
      /// response.data["succeed"] return true if request
      /// succeed and false if not so if was true we don't need
      /// return this value to model we just need the data
      var model;
      print('object');
      responseValidator.processData(response);

      if (responseValidator.isValid) {
        /// Here we send the data from response to Models factory
        /// to assign data as model
        try {
          model = ModelsFactory().createModel<T>(response.data, false);
        } catch (e, stacktrace) {
          stacktrace.toString().logE;
          return Left(CustomError(message: e.toString()));
        }
        return Right(model);
      } else if (responseValidator.hasError) {
        return Left(CustomError(message: responseValidator.errorMessage!));
      } else {
        return Left(CustomError(message: "generalErrorMessage".tr));
      }
    }
    /// Handling errors
    on DioException catch (e, stacktrace) {
      stacktrace.toString().logE;

      // Deserialize the error response
      if (e.response?.data != null && e.response?.data.isNotEmpty) {
        final errorResponse = ErrorResponse.fromJson(e.response!.data);
        return Left(
          CustomError(
            message: errorResponse.message ?? 'Unknown error',
            errors: errorResponse.data ?? {"Error": "Unhandled"},
          ),
        );
      } else if (e.response?.statusMessage != null &&
          e.response?.statusMessage != "") {
        return Left(
          CustomError(
            message: e.response!.statusMessage ?? 'Unknown error',
            errors: {"Error": "Unhandled"},
          ),
        );
      } else {
        return Left(_handleDioError(e));
      }
    }
    // on DioException catch (e, stacktrace) {
    //   stacktrace.toString().logE;
    //   return Left(_handleDioError(e));
    // }
    /// Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      stacktrace.toString().logE;
      return const Left(SocketError());
    }
  }

  Future<Either<AppErrors, List<T>>> sendListRequest<T extends BaseModel>({
    required HttpMethod method,
    required String url,
    required ResponseValidator responseValidator,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    String? baseUrl,
    bool isFormData = false,
    String key = "Response",
  }) async {
    if (baseUrl != null) {
      _client.options.baseUrl = baseUrl;
    } else {
      _client.options.baseUrl = APIUrls.baseUrl;
    }

    // Get the response from the server
    Response response;
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await _client.get(
            url,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.POST:
          response = await _client.post(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PUT:
          response = await _client.put(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await _client.delete(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PATCH:
          response = await _client.patch(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }
      // Get the decoded json
      /// json response like this
      /// {"data":"our data",
      /// "succeed":true of false,
      /// "message":"message if there is error"}
      /// response.data["succeed"] return true if request
      /// succeed and false if not so if was true we don't need
      /// return this value to model we just need the data
      List<T> model;
      responseValidator.processData(response);

      if (responseValidator.isValid) {
        /// Here we send the data from response to Models factory
        /// to assign data as model
        try {
          model = (response.data[key] as List)
              .map((e) => ModelsFactory().createModel<T>(e, true))
              .toList();
        } catch (e, stacktrace) {
          stacktrace.toString().logE;
          return Left(CustomError(message: e.toString()));
        }
        return Right(model);
      } else if (responseValidator.hasError) {
        return Left(CustomError(message: responseValidator.errorMessage!));
      } else {
        return Left(CustomError(message: "generalErrorMessage".tr));
      }
    }
    /// Handling errors
    on DioException catch (e, stacktrace) {
      stacktrace.toString().logE;
      return Left(_handleDioError(e));
    }
    /// Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      stacktrace.toString().logE;
      return const Left(SocketError());
    }
  }

  Future<Either<AppErrors, T>> upload<T extends BaseModel>({
    required String url,
    required String fileKey,
    required String filePath,
    required String fileName,
    required ResponseValidator responseValidator,
    MediaType? mediaType,
    CancelToken? cancelToken,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    String? baseUrl,
  }) async {
    if (baseUrl != null) {
      _client.options.baseUrl = baseUrl;
    } else {
      _client.options.baseUrl = APIUrls.baseUrl;
    }

    Map<String, dynamic> dataMap = {};
    if (data != null) {
      dataMap.addAll(data);
    }
    dataMap.addAll({
      fileKey: await MultipartFile.fromFile(
        filePath,
        filename: fileName,
        contentType: mediaType,
      ),
    });
    try {
      final response = await _client.post(
        url,
        data: FormData.fromMap(dataMap),
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );

      // Get the decoded json
      /// json response like this
      /// {"data":"our data",
      /// "succeed":true of false,
      /// "message":"message if there is error"}
      /// response.data["succeed"] return true if request
      /// succeed and false if not so if was true we don't need
      /// return this value to model we just need the data
      var model;
      responseValidator.processData(response);

      if (responseValidator.isValid) {
        /// Here we send the data from response to Models factory
        /// to assign data as model
        try {
          model = ModelsFactory().createModel<T>(response.data, false);
        } catch (e, stacktrace) {
          stacktrace.toString().logE;
          return Left(CustomError(message: e.toString()));
        }
        return Right(model);
      } else {
        return responseValidator.hasError
            ? Left(CustomError(message: responseValidator.errorMessage!))
            : const Left(UnknownError());
      }
    }
    // Handling errors
    on DioException catch (e, stacktrace) {
      stacktrace.toString().logE;
      return Left(_handleDioError(e));
    }
    // Couldn't reach out the server
    on SocketException catch (e, stacktrace) {
      stacktrace.toString().logE;
      return const Left(SocketError());
    }
  }

  AppErrors _handleDioError<E>(DioException error) {
    if (error.type == DioExceptionType.unknown ||
        error.type == DioExceptionType.badResponse) {
      if (error.error is SocketException) return const SocketError();
      if (error.type == DioExceptionType.badResponse) {
        switch (error.response!.statusCode) {
          case 400:
            return BadRequestError(
              message:
                  error.response?.data["message"] ??
                  error.response?.data["error"] ??
                  "",
              errors:
                  error.response?.data["errors"] != null &&
                      error.response?.data["errors"] is Map
                  ? error.response?.data["errors"] as Map<String, dynamic>
                  : {},
            );
          case 401:
            if (LocalStorage.hasToken || getIt<SessionData>().user != null) {
              // Future.delayed(const Duration(seconds: 2), () {
              Utils.logout();
              // });
            }
            return UnauthorizedError(
              message:
                  error.response?.data["message"] ??
                  error.response?.data["error"] ??
                  "",
            );
          case 403:
            // Utils.logout();
            return const ForbiddenError();
          case 404:
            return NotFoundError(
              error.requestOptions.path,
              message:
                  error.response?.data["message"] ??
                  error.response?.data["error"],
            );
          case 409:
            return const ConflictError();
          case 422:
            return BadRequestError(
              message:
                  error.response?.data["message"] ??
                  error.response?.data["error"] ??
                  "",
              errors:
                  error.response?.data["errors"] != null &&
                      error.response?.data["errors"] is Map
                  ? error.response?.data["errors"] as Map<String, dynamic>
                  : {},
            );
          case 500:
            if (error.response?.data is Map) {
              if (error.response!.data?["message"] != null ||
                  error.response!.data?["errorCode"] != null) {
                final errorCode =
                    int.tryParse(
                      error.response!.data?["errorCode"]?.toString() ?? "",
                    ) ??
                    500;

                return InternalServerWithDataError(
                  errorCode,
                  message:
                      error.response?.data?["message"] ??
                      error.response?.data["error"] ??
                      "",
                  type: ErrorCodeType.mapToType(errorCode),
                );
              }
            }
            return const InternalServerError();

          //   return ErrorMessageModel<E>.fromMap(error.response!.data);
          default:
            return const UnknownError();
        }
      }
      return const UnknownError();
    } else {
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return const TimeoutError();
      } else if (error.type == DioExceptionType.cancel) {
        return CancelError("cancelErrorMessage".tr);
      } else {
        return const UnknownError();
      }
    }
  }
}
