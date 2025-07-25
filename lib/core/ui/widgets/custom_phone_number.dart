import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import '../../../export_files.dart';

// ignore_for_file: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    super.key,
    required this.country,
    required this.onTap,
    required this.controller,
    this.suffix,
  });

  Country country;

  Function(Country) onTap;

  TextEditingController? controller;

  CustomImageView? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          22.h,
        ),
        border: Border.all(
          color: appTheme.lightBlue800,
          width: 1.h,
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _openCountryPicker(context);
            },
            child: Container(
              padding: EdgeInsets.all(12.h).copyWith(left: 0.h),
              decoration: BoxDecoration(
                color: appTheme.lightBlue800,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(22.h),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      "+${country.phoneCode}",
                      style: CustomTextStyles.titleMediumInterOnPrimary,
                    ),
                  ),
                  CustomImageView(
                    imagePath: AppConstants.imgArrowDown,
                    height: 10.h,
                    width: 18.h,
                    margin: EdgeInsets.only(left: 14.h),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 250.h,
              margin: EdgeInsets.only(left: 6.h),
              child: TextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                controller: controller,
                style: CustomTextStyles.bodyMediumOnPrimary,
                decoration: InputDecoration(
                  hintText: "lbl_000_256_2547".tr,
                  hintStyle: CustomTextStyles.bodyMediumOnPrimary,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(14.h),
                  suffixIcon: suffix,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            margin: EdgeInsets.only(
              left: 10.h,
            ),
            width: 60.h,
            child: Text(
              "+${country.phoneCode}",
              style: TextStyle(fontSize: 14.fSize),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name,
              style: TextStyle(fontSize: 14.fSize),
            ),
          )
        ],
      );
  void _openCountryPicker(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          searchInputDecoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: 14.fSize),
          ),
          isSearchable: true,
          title: Text('Select your phone code',
              style: TextStyle(fontSize: 14.fSize)),
          onValuePicked: (Country country) => onTap(country),
          itemBuilder: _buildDialogItem,
        ),
      );
}
