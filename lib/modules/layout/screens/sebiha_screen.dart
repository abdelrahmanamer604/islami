import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/app_strings.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/widgets/background_gradient.dart';

class SebihaScreen extends StatefulWidget {
  const SebihaScreen({super.key});

  @override
  State<SebihaScreen> createState() => _SebihaScreenState();
}

class _SebihaScreenState extends State<SebihaScreen> {

  double angle = 0;

  int counter = 0;

  int zekrIndex = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  void onSebihaTap() {
    setState(() {
      angle += 0.05;
      counter++;

      if (counter == 33) {
        counter = 0;
        zekrIndex = (zekrIndex + 1) % azkar.length;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(AppAssets.bgSebiha,
                fit: BoxFit.cover,
                ),
            ),
            const BackgroundGradient(),
         SafeArea(
           child: Column(
             children: [
               Image.asset(AppAssets.logoText,width: 430.w,),
               Text(
                 AppStrings.tasbih,
                 style: AppTextStyles.tasbih,
               ),
                SizedBox(height: 16.h),
      
               Stack(
                 alignment: Alignment.topCenter,
                 children: [
                   Padding(
                     padding:  EdgeInsets.only(top:75.h),
                     child: GestureDetector(
                       onTap: onSebihaTap,
                       child: AnimatedRotation(
                         turns: angle,
                         duration: const Duration(milliseconds: 200),
                         child: Image.asset(
                           AppAssets.sebihaBody,
                           width: 379.w,
                         ),
                       ),
                     ),
                   ),
      
                   Image.asset(
                     AppAssets.sebihaHead,
                     width: 145.w,
                   ),
                   Column(
                     children: [
                        SizedBox(height: 229.h),
      
                       Text(
                         azkar[zekrIndex],
                         style: AppTextStyles.zekr,
                         ),

                       SizedBox(height: 10.h),
      
                       Text(
                         "$counter",
                         style: AppTextStyles.zekr,
                       ),
                     ],
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
