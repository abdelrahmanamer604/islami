import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/modules/layout/models/hadeth_model.dart';

class HadethCard extends StatelessWidget {
  final HadethModel hadeth;

  const HadethCard({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: .25,
                child: Image.asset(AppAssets.hadethCardBg, fit: BoxFit.none),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: .25,
                child: Image.asset(AppAssets.soundRadio, fit: BoxFit.fitWidth),
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                  ).copyWith(top: 20.h),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.left,
                        color: AppColors.black,
                        width: 93.w,
                      ),

                      Expanded(
                        child: Text(
                          hadeth.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.hadethTitle,
                        ),
                      ),

                      Image.asset(
                        AppAssets.right,
                        color: AppColors.black,
                        width: 93.w,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ).copyWith(bottom: 60.h),
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.hadethContent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
