import '../../../../../../export_files.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(bottom: 46.h),
            padding: EdgeInsets.symmetric(horizontal: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "msg_don_t_have_an_account".tr,
                  style: CustomTextStyles.bodyMediumMontserrat,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "lbl_sign_up".tr,
                    style: CustomTextStyles.titleMediumInterSemiBold,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
