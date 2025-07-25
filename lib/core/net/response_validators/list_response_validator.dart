import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/core/errors/app_errors.dart';
import 'package:jewish_app/core/net/response_validators/response_validator.dart';
import 'package:dio/dio.dart';

class ListResponseValidator extends ResponseValidator {
  @override
  void processData(Response response) {
    if (response.data is! Map<String, dynamic> &&
        response.data['Response'] is! List) {
      error = AppErrors.customError(message: "notValidResponse".tr);
      errorMessage = "notValidResponse".tr;
    }
  }
}
