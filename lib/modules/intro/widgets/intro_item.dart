import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_text_styles.dart';

class IntroItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const IntroItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Image.asset(AppAssets.logoText, width: 290.w),

          SizedBox(height: 30.h),

          Expanded(child: Image.asset(image, fit: BoxFit.contain)),

          SizedBox(height: 20.h),

          Text(title, style: AppTextStyles.title, textAlign: TextAlign.center),

          SizedBox(height: 16.h),

          Text(
            description,
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
