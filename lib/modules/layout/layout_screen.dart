import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/app_strings.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/modules/layout/screens/hadeth_screen.dart';
import 'package:islami/modules/layout/screens/quran_screen.dart';
import 'package:islami/modules/layout/screens/radio_screen.dart';
import 'package:islami/modules/layout/screens/salaah_screen.dart';
import 'package:islami/modules/layout/screens/sebiha_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  static const String routeName = "/layout";

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    QuranScreen(),
    HadethScreen(),
    SebihaScreen(),
    RadioScreen(),
    SalaahScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: AppColors.gold,
        fixedColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: AppTextStyles.navSelected,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          getNavItem(icon: AppAssets.quran, label: AppStrings.quran),
          getNavItem(icon: AppAssets.hadeth, label: AppStrings.hadeth),
          getNavItem(icon: AppAssets.sebiha, label: AppStrings.sebiha),
          getNavItem(icon: AppAssets.radio, label: AppStrings.radio),
          getNavItem(icon: AppAssets.salaah, label: AppStrings.salaah),
        ],
      ),
    );
  }

  BottomNavigationBarItem getNavItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(icon, width: 24.w, height: 24.h),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(66.r),
        ),
        child: Image.asset(
          icon,
          width: 24.w,
          height: 24.h,
          color: AppColors.white,
        ),
      ),
      label: label,
    );
  }
}
