import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/app_strings.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/modules/layout/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  final SuraModel sura;
  final int index;
  final VoidCallback onTap;

  const SuraItem({
    super.key,
    required this.sura,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(AppAssets.numberFrame, width: 52.w),
                    Text(
                      "${index + 1}",
                      style: AppTextStyles.verses.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 24.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sura.englishName,
                      style: AppTextStyles.recentEnglish.copyWith(
                        fontSize: 20.sp,
                        color: AppColors.white,
                      ),
                    ),

                    Text(
                      "${sura.verses} ${AppStrings.verses}",
                      style: AppTextStyles.verses.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                Text(
                  sura.arabicName,
                  style: AppTextStyles.recentArabic.copyWith(
                    fontSize: 20.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            Divider(indent: 40.w, endIndent: 40.w, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
