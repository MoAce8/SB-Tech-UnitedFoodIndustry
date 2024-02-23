import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';


class AppTextStyles {
  static final h1 = TextStyle(
      color: AppColors.oliveAccent,
      fontSize: 19.sp,
      fontWeight: FontWeight.w700
  );
  static final h3 = TextStyle(
      color: AppColors.darkOlive,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400
  );
  static final title = TextStyle(
      color: Colors.white,
      fontSize: 23.sp,
      fontWeight: FontWeight.w700
  );
  static final button = TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700
  );
  static final h2 = TextStyle(
    color: AppColors.primaryGreen,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static final body = TextStyle(
    color: AppColors.redError,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
}


extension TextExt on String {
  Text h1({Color? color})=>Text(this, style: AppTextStyles.h1.copyWith(color: color));
  Text h2({Color? color})=>Text(this, style: AppTextStyles.h2.copyWith(color: color));
  Text h3({Color? color})=>Text(this, style: AppTextStyles.h3.copyWith(color: color));
  Text btn({Color? color})=>Text(this, style: AppTextStyles.button.copyWith(color: color));
  Text title({Color? color})=>Text(this, style: AppTextStyles.title.copyWith(color: color));
  Text body({Color? color})=>Text(this,  textAlign: TextAlign.center, style: AppTextStyles.body.copyWith(color: color));
}