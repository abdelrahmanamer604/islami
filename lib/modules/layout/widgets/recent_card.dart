import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/app_strings.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/modules/layout/models/sura_model.dart';
import 'package:islami/modules/layout/screens/sura_details_screen.dart';

class RecentCard extends StatelessWidget {
  final SuraModel sura;
  final int index;

  const RecentCard({super.key, required this.sura, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SuraDetailsScreen(sura: sura, index: index),
          ),
        );
      },
      child: Container(
        width: size.width * .68,
        height: size.height * .16,
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sura.englishName, style: AppTextStyles.recentEnglish),

                  SizedBox(height: 6.h),

                  Text(sura.arabicName, style: AppTextStyles.recentArabic),

                  const Spacer(),

                  Text(
                    "${sura.verses} ${AppStrings.verses}",
                    style: AppTextStyles.verses,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),

            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: size.width * .42,
                child: Image.asset(AppAssets.recently, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
