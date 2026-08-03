import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.black.withValues(alpha: 0.7), AppColors.black],
          ),
        ),
      ),
    );
  }
}
