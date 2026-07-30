import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';

class RadioItem extends StatelessWidget {
  final String title;
  final bool isPlaying;

  const RadioItem({
    super.key,
    required this.title,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        height: 141.h,
        decoration: const BoxDecoration(
          color: AppColors.gold,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  isPlaying
                      ? AppAssets.soundWave
                      : AppAssets.soundRadio,
                  key: ValueKey(isPlaying),
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.radioTitle,
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: 44.sp,
                        color: AppColors.black,
                      ),

                      SizedBox(width: 12.w),

                      Icon(
                        isPlaying
                            ? Icons.volume_off_rounded
                            : Icons.volume_up_rounded,
                        size: 30.sp,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}