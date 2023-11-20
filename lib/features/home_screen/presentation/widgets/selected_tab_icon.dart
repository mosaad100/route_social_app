// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/core/utils/app_colors.dart';

class SelectedTabIcon extends StatelessWidget {
  final Icon icon;

  const SelectedTabIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: AppColors.primaryGreenColor,
          border: Border.all(color: AppColors.blackColor, width: 2.5.w)),
      child: icon,
    );
  }
}
