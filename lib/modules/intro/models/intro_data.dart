import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/constants/app_strings.dart';
import 'package:islami/modules/intro/models/intro_model.dart';

List<IntroModel> onboardingPages = [
  IntroModel(
    image: AppAssets.intro1,
    title: AppStrings.welcome0,
    description: "",
  ),

  IntroModel(
    image: AppAssets.intro2,
    title: AppStrings.welcome1,
    description: AppStrings.welcomeDesc,
  ),

  IntroModel(
    image: AppAssets.intro3,
    title: AppStrings.reading,
    description: AppStrings.readingDesc,
  ),

  IntroModel(
    image: AppAssets.intro4,
    title: AppStrings.bearish,
    description: AppStrings.bearishDesc,
  ),

  IntroModel(
    image: AppAssets.intro5,
    title: AppStrings.radioTitle,
    description: AppStrings.radioDesc,
  ),
];
