import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:jewish_app/core/ui/components/components.dart';
import 'package:jewish_app/core/constants/app_assets.dart';
import 'dart:io';
import '../../../export_files.dart';

class CustomPhoneField extends StatelessWidget {
  final Country country;
  final Function(Country) onCountrySelected;
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool autofocus;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final bool isRequired;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final bool isNumber;
  final bool isText;
  final bool isSearch;
  final bool isMultiline;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? enabled;
  final bool? autovalidateMode;
  const CustomPhoneField({
    super.key,
    required this.country,
    required this.onCountrySelected,
    required this.controller,
    this.hintText,
    this.validator,
    this.readOnly = false,
    this.autofocus = false,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffix,
    this.prefix,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.contentPadding,
    this.boxDecoration,
    this.textStyle,
    this.hintStyle,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.height,
    this.width,
    this.alignment,
    this.isRequired = false,
    this.isPassword = false,
    this.isEmail = false,
    this.isPhone = true,
    this.isNumber = false,
    this.isText = false,
    this.isSearch = false,
    this.isMultiline = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.enabled,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      autovalidateMode: autovalidateMode == true
          ? AutovalidateMode.onUserInteraction
          : null,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: height ?? 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.h),
                border: Border.all(
                  color: state.hasError ? Colors.red : const Color(0xFF52059F),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _openCountryPicker(context);
                    },
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: fillColor ?? appTheme.lightBlue800,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(22.h),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "+${country.phoneCode}",
                            style:
                                textStyle ??
                                context.textTheme.bodyMedium?.copyWith(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                          ),
                          CustomImageView(
                            imagePath: AppAssets.icons.arrowDown,
                            height: 10.h,
                            width: 18.h,
                            margin: EdgeInsets.only(left: 14.h),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.black,
                      focusNode: focusNode,
                      autofocus: autofocus,
                      controller: controller,
                      textAlignVertical: TextAlignVertical.center,
                      style:
                          textStyle ??
                          context.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                      decoration: InputDecoration(
                        hintText: hintText ?? "lbl_000_256_2547".tr,
                        hintStyle:
                            hintStyle ??
                            context.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: const Color(0x80252525),
                            ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        filled: false,
                        contentPadding:
                            contentPadding ??
                            EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 11.h,
                            ),
                        suffixIcon: suffix,
                      ),
                      readOnly: readOnly,
                      onTap: () {
                        state.reset();
                        onTap?.call();
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) {
                        state.didChange(value);
                        onChanged?.call(value);
                      },
                      onFieldSubmitted: (value) {
                        state.validate();
                        onFieldSubmitted?.call(value);
                      },
                      obscureText: obscureText,
                      keyboardType: keyboardType ?? TextInputType.phone,
                      textInputAction: textInputAction,
                      maxLines: maxLines,
                      minLines: minLines,
                      maxLength: maxLength,
                      enabled: enabled,
                    ),
                  ),
                ],
              ),
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsets.only(left: 14.h, top: 4.h),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10.fSize,
                    height: Platform.isAndroid ? 1.2 : 0.5,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildDialogItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      Container(
        margin: EdgeInsets.only(left: 10.h),
        width: 60.h,
        child: Text(
          "+${country.phoneCode}",
          style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
        ),
      ),
      const SizedBox(width: 8.0),
      Flexible(
        child: Text(
          country.name,
          style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
        ),
      ),
    ],
  );

  void _openCountryPicker(BuildContext context) => showDialog(
    context: context,
    builder: (dialogContext) => CountryPickerDialog(
      searchInputDecoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: TextStyle(fontSize: 14, fontFamily: 'Inter'),
      ),
      isSearchable: true,
      title: Text(
        'Select your phone code',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
      onValuePicked: (Country country) => onCountrySelected(country),
      itemBuilder: _buildDialogItem,
    ),
  );
}
