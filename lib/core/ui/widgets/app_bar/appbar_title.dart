import 'package:flutter/material.dart';
import '../../../../export_files.dart';

class AppbarTitle extends StatelessWidget {
  AppbarTitle({Key? key, required this.text, this.onTap, this.margin})
      : super(
          key: key,
        );

  final String text;

  final Function? onTap;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.titleLargeMontserrat.copyWith(
            color: theme.colorScheme.onPrimary.withOpacity(1),
          ),
        ),
      ),
    );
  }
}
