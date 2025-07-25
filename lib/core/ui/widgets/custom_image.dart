import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:jewish_app/core/common/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jewish_app/core/common/extensions/logger_extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:jewish_app/core/common/app_config.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/dialog/errv_dialog_options.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/dialog/show_error_dialog.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/errv_options.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/snack_bar/show_error_snackbar.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/toast/errv_toast_options.dart';
import 'package:jewish_app/core/ui/error_ui/error_viewer/toast/show_error_toast.dart';

import '../../../export_files.dart';

class CustomImage {
  CustomImage._();

  static Widget network(
    String imageUrl, {
    String? placeholderAssetImage,
    Widget Function(BuildContext, String)? placeholderBuilder,
    Widget Function(BuildContext, String, DownloadProgress)?
    progressIndicatorBuilder,
    Widget Function(BuildContext, String, dynamic)? errorBuilder,
    bool showError = false,
    bool showProgressIndicator = false,
    ErrorViewerOptions? errorViewerOptions,
    double? height,
    double? width,
    BoxFit? fit,
    Alignment alignment = Alignment.center,
    int? memCacheWidth,
    int? memCacheHeight,
    String? cacheKey,
    int? maxWidthDiskCache,
    int? maxHeightDiskCache,
    Color? shimmerBaseColor,
    Color? shimmerHighlightColor,
    Color? placeholderForgroundColor,
    Key? key,
    Map<String, String>? httpHeaders,
    Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
    Duration? fadeOutDuration = const Duration(milliseconds: 1000),
    Curve fadeOutCurve = Curves.easeOut,
    Duration fadeInDuration = const Duration(milliseconds: 500),
    Curve fadeInCurve = Curves.easeIn,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    bool matchTextDirection = false,
    bool useOldImageOnUrlChange = false,
    Color? color,
    FilterQuality filterQuality = FilterQuality.low,
    BlendMode? colorBlendMode,
    Duration? placeholderFadeInDuration,
    Size? placeholderSize,
    BoxFit? placeholderFit,
  }) {
    assert(placeholderBuilder == null || progressIndicatorBuilder == null);
    return imageUrl.toLowerCase().endsWith(".svg")
        ? SvgPicture.network(
            imageUrl,
            key: key,
            width: width,
            height: height,
            colorFilter: color != null
                ? ColorFilter.mode(color, colorBlendMode ?? BlendMode.srcIn)
                : null,
            fit: fit ?? BoxFit.contain,
            alignment: alignment,
          )
        : CachedNetworkImage(
            color: color,
            colorBlendMode: colorBlendMode,
            fadeInCurve: fadeInCurve,
            fadeInDuration: fadeInDuration,
            fadeOutCurve: fadeOutCurve,
            fadeOutDuration: fadeOutDuration,
            filterQuality: filterQuality,
            httpHeaders: httpHeaders,
            imageBuilder: imageBuilder,
            key: key,
            matchTextDirection: matchTextDirection,
            placeholderFadeInDuration: placeholderFadeInDuration,
            repeat: repeat,
            useOldImageOnUrlChange: useOldImageOnUrlChange,
            memCacheHeight: memCacheHeight,
            memCacheWidth: memCacheWidth,
            maxHeightDiskCache: maxHeightDiskCache,
            maxWidthDiskCache: maxWidthDiskCache,
            cacheKey: cacheKey,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            imageUrl: imageUrl,
            placeholder:
                placeholderBuilder ??
                (progressIndicatorBuilder == null && !showProgressIndicator
                    ? (context, url) {
                        return Container(
                          color: AppColors.mssNeutral40,
                          child: Shimmer.fromColors(
                            baseColor:
                                shimmerBaseColor ?? AppColors.mssNeutral60,
                            highlightColor:
                                shimmerHighlightColor ??
                                AppColors.mssNeutral100,
                            period: const Duration(seconds: 2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Align(
                                child: CustomImage.asset(
                                  AppConstants.appLogo,
                                  width: width,
                                  height: height,
                                  fit: BoxFit.fitHeight,
                                  alignment: alignment,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    : null),
            errorWidget:
                errorBuilder ??
                (context, url, error) {
                  if (showError) {
                    if (errorViewerOptions is ErrVSnackBarOptions) {
                      showErrorSnackBar(
                        message: error.toString(),
                        errVSnackBarOptions: errorViewerOptions,
                      );
                      // } else if (errorViewerOptions is ErrVToastOptions) {
                      //   showErrorToast(
                      //     message: error.toString(),
                      //     context: context,
                      //     errVToastOptions: errorViewerOptions,
                      //   );
                    } else if (errorViewerOptions is ErrVDialogOptions) {
                      showCustomErrorDialog(
                        context: AppConfig().appContext!,
                        message: error.toString(),
                        errVDialogOptions: errorViewerOptions,
                      );
                    } else {
                      error.toString().logE;
                    }
                  }
                  return placeholderAssetImage == null
                      ? Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          color: AppColors.mssNeutral40,
                          child: CustomImage.asset(
                            AppConstants.appLogo,
                            width: width,
                            height: height,
                            color: AppColors.mssNeutral60,
                            fit: BoxFit.fitHeight,
                            alignment: alignment,
                          ),
                        )
                      : SizedBox(
                          height: placeholderSize?.height,
                          width: placeholderSize?.width,
                          child: Align(
                            child: CustomImage.asset(
                              placeholderAssetImage,
                              height: placeholderSize?.height ?? height,
                              width: placeholderSize?.width ?? width,
                              fit: placeholderFit ?? fit,
                              alignment: alignment,
                              color: placeholderForgroundColor,
                            ),
                          ),
                        );
                },
            progressIndicatorBuilder:
                progressIndicatorBuilder ??
                (placeholderBuilder == null && showProgressIndicator
                    ? (context, url, progress) {
                        if (progress.totalSize == null) {
                          return CustomImage.asset(
                            AppConstants.appLogo,
                            width: width,
                            height: height,
                            fit: fit ?? BoxFit.contain,
                            alignment: alignment,
                          );
                        }
                        return CircularProgressIndicator(
                          backgroundColor: Colors.black26,
                          color: Colors.cyan,
                          value: progress.downloaded / progress.totalSize!,
                        );
                      }
                    : null),
          );
  }

  static Widget asset(
    String imagePath, {
    Key? key,
    double? scale,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) {
    final isSvg = imagePath.endsWith('svg');
    return isSvg
        ? SvgPicture.asset(
            imagePath,
            key: key,
            width: width,
            height: height,
            colorFilter: color != null
                ? ColorFilter.mode(color, colorBlendMode ?? BlendMode.srcIn)
                : null,
            fit: fit ?? BoxFit.contain,
            alignment: alignment,
          )
        : Image.asset(
            imagePath,
            key: key,
            scale: scale,
            width: width,
            height: height,
            color: color,
            fit: fit,
            alignment: alignment,
            colorBlendMode: colorBlendMode,
            repeat: repeat,
          );
  }

  static Widget memory(
    dynamic image, {
    Key? key,
    double scale = 1.0,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    Widget? placeholder,
    String? placeholderAsset,
  }) {
    try {
      Uint8List? bytes;
      if (image is String) {
        // Check if it's base64 encoded by matching typical base64 patterns
        final isBase64 =
            image.startsWith('data:image') ||
            RegExp(r'^[A-Za-z0-9+/]+={0,2}$').hasMatch(image);

        if (isBase64) {
          bytes = base64Decode(image);
          return Image.memory(
            bytes,
            key: key ?? UniqueKey(),
            scale: scale,
            width: width,
            height: height,
            color: color ?? Colors.transparent,
            fit: fit ?? BoxFit.contain,
            alignment: alignment,
            colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
          );
        } else {
          // Treat as file path
          return Image.file(
            File(image),
            key: key ?? UniqueKey(),
            scale: scale,
            width: width,
            height: height,
            color: color,
            fit: fit ?? BoxFit.contain,
            alignment: alignment,
            colorBlendMode: colorBlendMode,
          );
        }
      } else if (image is Uint8List) {
        // Directly use Uint8List
        return Image.memory(
          image,
          key: key ?? UniqueKey(),
          scale: scale,
          width: width,
          height: height,
          color: color ?? Colors.transparent,
          fit: fit ?? BoxFit.contain,
          alignment: alignment,
          colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
        );
      } else if (image is XFile) {
        // If XFile, use Image.file with its path
        return Image.file(
          File(image.path),
          key: key ?? UniqueKey(),
          scale: scale,
          width: width,
          height: height,
          color: color,
          fit: fit ?? BoxFit.contain,
          alignment: alignment,
          colorBlendMode: colorBlendMode,
        );
      } else {
        // Placeholder in case of unsupported type
        return placeholder ??
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: AppColors.mssNeutral40,
              child: CustomImage.asset(
                placeholderAsset ?? AppConstants.appLogo,
                width: width,
                height: height,
                color: AppColors.mssNeutral80,
                fit: BoxFit.fitHeight,
                alignment: alignment,
              ),
            );
      }
    } catch (e) {
      e.toString().logE;
      return placeholder ??
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: AppColors.mssNeutral40,
            child: CustomImage.asset(
              placeholderAsset ?? AppConstants.appLogo,
              width: width,
              height: height,
              color: AppColors.mssNeutral80,
              fit: BoxFit.fitHeight,
              alignment: alignment,
            ),
          );
    }
  }
}
