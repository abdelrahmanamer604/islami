import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/modules/layout/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  final SuraModel sura;
  final int index;

  const SuraDetailsScreen({super.key, required this.sura, required this.index});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  int? selectedVerse;
  List<String> verses = [];

  @override
  void initState() {
    super.initState();
    loadSura();
  }

  Future<void> loadSura() async {
    final path = 'assets/suras/${widget.index + 1}.txt';

    final file = await rootBundle.loadString(path);

    verses = file.trim().split('\n');

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.gold),
        title: Text(
          widget.sura.englishName,
          style: AppTextStyles.recentEnglish.copyWith(color: AppColors.gold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppAssets.left, width: 93.w),

                Expanded(
                  child: Center(
                    child: Text(
                      widget.sura.arabicName,
                      style: AppTextStyles.recentArabic.copyWith(
                        color: AppColors.gold,
                      ),
                    ),
                  ),
                ),

                Image.asset(AppAssets.right, width: 93.w),
              ],
            ),

            SizedBox(height: 33.h),

            Expanded(
              child: ListView.builder(
                itemCount: verses.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedVerse == index;

                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.r),
                      onTap: () {
                        setState(() {
                          selectedVerse = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.gold
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: AppColors.gold),
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "${verses[index]}  [${index + 1}]",
                                style: AppTextStyles.recentArabic.copyWith(
                                  color: isSelected
                                      ? AppColors.black
                                      : AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
