import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/widgets/background_gradient.dart';
import 'package:islami/modules/layout/models/hadeth_model.dart';
import 'package:islami/modules/layout/widgets/hadeth_card.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  final List<HadethModel> hadeths = [];

  @override
  void initState() {
    super.initState();
    loadHadeths();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: 220.h,
            child: Image.asset(AppAssets.bgHadeth, fit: BoxFit.contain),
          ),

          const BackgroundGradient(),

          SafeArea(
            child: Column(
              children: [
                Image.asset(AppAssets.logoText, width: 430.w),

                Expanded(
                  child: CarouselSlider.builder(
                    itemCount: hadeths.length,
                    itemBuilder: (context, index, realIndex) {
                      return HadethCard(hadeth: hadeths[index]);
                    },
                    options: CarouselOptions(
                      height: size.height * .66,
                      initialPage: 0,
                      viewportFraction: .75,
                      enlargeCenterPage: true,
                      enlargeFactor: .25,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadHadeths() async {
    hadeths.clear();

    for (int i = 1; i <= 50; i++) {
      final file = await rootBundle.loadString("assets/hadeth/h$i.txt");

      final lines = file.trim().split("\n");

      hadeths.add(
        HadethModel(
          title: lines.first.trim(),
          content: lines.sublist(1).join("\n").trim(),
        ),
      );
    }

    setState(() {});
  }
}
