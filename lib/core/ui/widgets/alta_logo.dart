import 'package:flutter/material.dart';
import 'package:jewish_app/export_files.dart';
import 'package:jewish_app/features/account/presentation/screen/login/widget/image_with_label.dart';

import '../../navigation/nav.dart';
import 'app_bar/appbar_leading_image.dart';
import 'app_bar/custom_app_bar.dart';

class AltaLogo extends StatelessWidget {
  final bool hasBackButton;
  final String label;
  final double height;
  const AltaLogo({
    super.key,
    this.label = "",
    this.height = 270,
    this.hasBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return hasBackButton
        ? _buildAppBarWithBackButton(label)
        : _buildAppBarSection();
  }

  Widget _buildAppBarWithBackButton(String label) {
    return Container(
      height: height.h,
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 16.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: (height - 32).h,
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
              ).copyWith(bottom: 0.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAppBar(
                    leadingWidth: 40.h,
                    leading: AppbarLeadingImage(
                      imagePath: AppConstants.imgArrowLeft,
                      margin: EdgeInsets.only(left: 16.h),
                      onTap: () {
                        Nav.pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath: AppConstants.imgGroup6837,
                  height: 56.h,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 66.h, right: 82.h),
                ),
                SizedBox(height: 34.h),
                Text(
                  label.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarSection() {
    return SizedBox(
      height: 270.h,
      width: 278.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          const ImageWithLabel(),
          CustomImageView(
            imagePath: AppConstants.imgGroup6837,
            height: 56.h,
            width: 206.h,
          ),
        ],
      ),
    );
  }
}
