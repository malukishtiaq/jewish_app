import 'package:flutter/material.dart';
import '../../../export_files.dart';

enum BottomBarEnum { record, gallery, settings }

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({
    super.key,
    this.onChanged,
    this.currentIndex = 0,
  });

  Function(BottomBarEnum)? onChanged;
  int currentIndex;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: AppConstants.imgNavAuctions,
      activeIcon: AppConstants.auctionBright,
      title: "Record".tr,
      type: BottomBarEnum.record,
    ),
    BottomMenuModel(
      icon: AppConstants.imgNavHome,
      activeIcon: AppConstants.homeBright,
      title: "Gallery".tr,
      type: BottomBarEnum.gallery,
    ),
    BottomMenuModel(
      icon: AppConstants.settingsDark,
      activeIcon: AppConstants.settingsBright,
      title: "lbl_settings".tr,
      type: BottomBarEnum.settings,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFF121E30),
        border: Border.all(
          color: const Color(0XFFCD163F),
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0X3F000000),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              -2,
            ),
          )
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24.h,
                  width: 24.h,
                  color: const Color(0XFFFFFFFF),
                ),
                SizedBox(height: 4.h),
                Text(
                  bottomMenuList[index].title ?? "",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: const Color(0X59FFFFFF),
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 24.h,
                  width: 24.h,
                  color: const Color(0XFFFFFFFF),
                ),
                SizedBox(height: 4.h),
                Text(
                  bottomMenuList[index].title ?? "",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          widget.currentIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      this.title,
      required this.type});

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
