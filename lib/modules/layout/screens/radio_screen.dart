import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/app_strings.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/widgets/background_gradient.dart';
import 'package:islami/modules/layout/widgets/radio_item.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isRadio = true;
  int playingIndex = -1;

  final List<String> radios = [
    AppStrings.radio1,
    AppStrings.radio2,
    AppStrings.radio3,
    AppStrings.radio4,
  ];

  final List<String> reciters = [
    AppStrings.reciter1,
    AppStrings.reciter2,
    AppStrings.reciter3,
    AppStrings.reciter4,
  ];

  List<String> get currentList => isRadio ? radios : reciters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 60.h,
            left: 0.h,
            right: 0.h,
            bottom: 0.h,
            child: Image.asset(
              AppAssets.bgRadio,
              fit: BoxFit.cover,
            ),
          ),

          const BackgroundGradient(),

          SafeArea(
            child: Column(
              children: [
                Image.asset(
                  AppAssets.logoText,
                  width: 291.w,
                ),

                 SizedBox(height: 7.h),

                Container(
                  margin:  EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildTab(
                          title: AppStrings.radioTab,
                          selected: isRadio,
                          onTap: () {
                            setState(() {
                              isRadio = true;
                              playingIndex = -1;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: _buildTab(
                          title: AppStrings.recitersTab,
                          selected: !isRadio,
                          onTap: () {
                            setState(() {
                              isRadio = false;
                              playingIndex = -1;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                 SizedBox(height: 12.h),

                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: currentList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            playingIndex =
                            playingIndex == index ? -1 : index;
                          });
                        },
                        child: RadioItem(
                          title: currentList[index],
                          isPlaying: playingIndex == index,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.gold : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          title,
          style: selected
              ? AppTextStyles.selectedRadioTab
              : AppTextStyles.radioTab,
        ),
      ),
    );
  }
}