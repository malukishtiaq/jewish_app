import 'package:flutter/material.dart';
import '../../../export_files.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.fieldLabel,
    this.fieldLabelStyle,
    this.leadingIcon,
    this.leadingIconPadding,
  });

  final Alignment? alignment;

  final double? width;

  final BoxDecoration? boxDecoration;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final bool? readOnly;

  final VoidCallback? onTap;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final void Function(String)? onChanged;

  final void Function(dynamic)? onFieldSubmitted;

  /// Optional label shown INSIDE the field container (Figma spec)
  final String? fieldLabel;

  /// Optional style for [fieldLabel]
  final TextStyle? fieldLabelStyle;

  /// Optional leading icon shown before the input value (inside the box)
  final Widget? leadingIcon;

  /// Padding around [leadingIcon] when provided (default: EdgeInsets.symmetric(horizontal: 10))
  final EdgeInsets? leadingIconPadding;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: textFormFieldWidget(context))
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => Container(
        width: widget.width ?? double.maxFinite,
        decoration: widget.fieldLabel != null || widget.leadingIcon != null
            ? null
            : widget.boxDecoration,
        child: FormField<String>(
          initialValue: widget.controller?.text ?? '',
          validator: widget.validator,
          builder: (FormFieldState<String> state) {
            final bool useLabeledBox =
                widget.fieldLabel != null || widget.leadingIcon != null;

            if (useLabeledBox) {
              final BoxDecoration effectiveDecoration = widget.boxDecoration ??
                  BoxDecoration(
                    color: widget.fillColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xFF8A5694),
                      width: 1,
                    ),
                  );

              return Container(
                decoration: effectiveDecoration,
                constraints: const BoxConstraints(minHeight: 53),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.fieldLabel != null)
                        Text(
                          widget.fieldLabel!,
                          style: widget.fieldLabelStyle ??
                              CustomTextStyles.fieldLabel13Bold(context),
                        ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          if (widget.leadingIcon != null) widget.leadingIcon!,
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              controller: widget.controller,
                              focusNode: widget.focusNode,
                              onTapOutside: (event) {
                                if (widget.focusNode != null) {
                                  widget.focusNode?.unfocus();
                                  state.validate();
                                } else {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                              autofocus: widget.autofocus!,
                              style: widget.textStyle ??
                                  const TextStyle(color: Colors.black),
                              obscureText: widget.obscureText!,
                              readOnly: widget.readOnly!,
                              textAlignVertical: TextAlignVertical.center,
                              onTap: () {
                                state.reset();
                                widget.onTap?.call();
                              },
                              onChanged: (value) {
                                state.didChange(value);
                                widget.onChanged?.call(value);
                              },
                              onFieldSubmitted: widget.onFieldSubmitted,
                              textInputAction: widget.textInputAction,
                              keyboardType: widget.textInputType,
                              maxLines: widget.maxLines ?? 1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isCollapsed: true,
                                contentPadding: EdgeInsets.zero,
                              ).copyWith(
                                hintText: widget.hintText ?? "",
                                hintStyle: widget.hintStyle ??
                                    CustomTextStyles.bodyMediumOnPrimary(
                                        context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (state.errorText != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            state.errorText!,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 10.fSize,
                              height: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }

            return TextFormField(
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              controller: widget.controller,
              focusNode: widget.focusNode,
              onTapOutside: (event) {
                if (widget.focusNode != null) {
                  widget.focusNode?.unfocus();
                  // Validate only when field loses focus
                  state.validate();
                } else {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              autofocus: widget.autofocus!,
              style: widget.textStyle ?? const TextStyle(color: Colors.black),
              obscureText: widget.obscureText!,
              readOnly: widget.readOnly!,
              textAlignVertical: TextAlignVertical.center,
              onTap: () {
                // Clear error when field is focused
                state.reset();
                widget.onTap?.call();
              },
              onChanged: (value) {
                state.didChange(value);
                widget.onChanged?.call(value);
              },
              onFieldSubmitted: widget.onFieldSubmitted,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              maxLines: widget.maxLines ?? 1,
              decoration: decoration.copyWith(
                errorText: state.errorText,
              ),
            );
          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: widget.hintText ?? "",
        hintStyle:
            widget.hintStyle ?? CustomTextStyles.bodyMediumOnPrimary(context),
        prefixIcon: widget.prefix,
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: widget.suffix,
        suffixIconConstraints: widget.suffixConstraints,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
        fillColor: widget.fillColor,
        filled: widget.filled,
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.h),
              borderSide: const BorderSide(
                color: Color(0xFF52059F),
                width: 1,
              ),
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.h),
              borderSide: const BorderSide(
                color: Color(0xFF52059F),
                width: 1,
              ),
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.h),
              borderSide: const BorderSide(
                color: Color(0xFF52059F),
                width: 1,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.h),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.h),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 10.fSize,
          height: 0.5,
        ),
        errorMaxLines: 1,
      );
}
