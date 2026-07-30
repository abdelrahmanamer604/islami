import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_strings.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/modules/intro/widgets/intro_item.dart';
import 'package:islami/modules/layout/screens/layout_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/intro_data.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const String routeName = "/intro";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pageController = PageController();

  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,bottom: 16,right: 16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: onboardingPages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return IntroItem(
                      image: onboardingPages[index].image,
                      title: onboardingPages[index].title,
                      description: onboardingPages[index].description,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: currentIndex == 0
                        ? null
                        : () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                    child:  Text(
                      AppStrings.back,
                      style: AppTextStyles.introButton,
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: pageController,
                    count: onboardingPages.length,
                    effect: WormEffect(
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                      activeDotColor: AppColors.gold,
                      dotColor: AppColors.gray,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      if (currentIndex == onboardingPages.length - 1) {
                        Navigator.pushReplacementNamed(
                          context,
                          LayoutScreen.routeName,
                        );
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == onboardingPages.length - 1
                          ? AppStrings.finish
                          : AppStrings.next,
                      style: AppTextStyles.introButton,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
