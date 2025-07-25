import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../export_files.dart';

// ignore_for_file: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField(
      {Key? key,
      required this.context,
      required this.onChanged,
      this.alignment,
      this.controller,
      this.textStyle,
      this.hintStyle,
      this.validator})
      : super(
          key: key,
        );

  final Alignment? alignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget)
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 6,
        backgroundColor: Colors.transparent,
        keyboardType: TextInputType.number,
        textStyle: (textStyle ?? CustomTextStyles.titleLargeBold)
            .copyWith(color: Colors.black),
        hintStyle: (hintStyle ?? CustomTextStyles.titleLargeBold)
            .copyWith(color: Colors.black),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 44.h,
          fieldWidth: 44.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.h),
          borderWidth: 2,
          inactiveColor: const Color(0xFF52059F).withOpacity(0.3),
          activeColor: const Color(0xFF52059F),
          inactiveFillColor: Colors.grey.shade50,
          activeFillColor: const Color(0xFF52059F).withOpacity(0.01),
          selectedFillColor: const Color(0xFF52059F).withOpacity(0.01),
          selectedColor: const Color(0xFF52059F),
        ),
        onChanged: (value) => onChanged(value),
        validator: validator,
      );
}
