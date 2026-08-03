import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/app_strings.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_text_styles.dart';
import 'package:islami/core/widgets/background_gradient.dart';
import 'package:islami/modules/layout/models/sura_model.dart';
import 'package:islami/modules/layout/screens/sura_details_screen.dart';
import 'package:islami/modules/layout/widgets/recent_card.dart';
import 'package:islami/modules/layout/widgets/sura_item.dart';
import '../../../core/constants/quran_data.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<SuraModel> filteredSuras = quranSuras;
  List<SuraModel> recentSuras = [];

  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.bgQuran, fit: BoxFit.cover),
          ),
          const BackgroundGradient(),

          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppAssets.logoText, width: 430.w),

                  SizedBox(height: 20.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 56.h,
                      child: TextField(
                        focusNode: searchFocusNode,
                        onChanged: search,
                        cursorColor: AppColors.gold,
                        style: AppTextStyles.searchHint,
                        decoration: InputDecoration(
                          hintText: AppStrings.suraName,
                          hintStyle: AppTextStyles.searchHint,
                          filled: true,
                          fillColor: Colors.transparent,

                          prefixIcon: Padding(
                            padding: EdgeInsets.all(14.w),
                            child: Image.asset(
                              AppAssets.quran,
                              color: AppColors.gold,
                              width: 28.w,
                              height: 28.h,
                            ),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: AppColors.gold),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: AppColors.gold),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                  if (!searchFocusNode.hasFocus && recentSuras.isNotEmpty) ...[
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        AppStrings.recently,
                        style: AppTextStyles.recently,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .20,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        itemCount: recentSuras.length,
                        separatorBuilder: (_, _) => SizedBox(width: 10.w),
                        itemBuilder: (context, index) {
                          return RecentCard(
                            sura: recentSuras[index],
                            index: quranSuras.indexOf(recentSuras[index]),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),
                  ],

                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      AppStrings.suraList,
                      style: AppTextStyles.suraList,
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredSuras.length,
                      itemBuilder: (context, index) {
                        final originalIndex = quranSuras.indexOf(
                          filteredSuras[index],
                        );
                        return SuraItem(
                          sura: filteredSuras[index],
                          index: originalIndex,
                          onTap: () {
                            addToRecent(filteredSuras[index]);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SuraDetailsScreen(
                                  sura: filteredSuras[index],
                                  index: originalIndex,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  void search(String value) {
    setState(() {
      if (value.isEmpty) {
        filteredSuras = quranSuras;
      } else {
        filteredSuras = quranSuras.where((sura) {
          return sura.englishName.toLowerCase().contains(value.toLowerCase()) ||
              sura.arabicName.contains(value);
        }).toList();
      }
    });
  }

  void addToRecent(SuraModel sura) {
    setState(() {
      recentSuras.remove(sura);
      recentSuras.insert(0, sura);

      if (recentSuras.length > 5) {
        recentSuras.removeLast();
      }
    });
  }
}
