import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/widgets/app_bar_custom.dart';
import 'package:goldy/core/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBarCustom(
        title: AppStrings.appName,
        color2: AppColors.goldColor,
        color: AppColors.black,
        automaticallyImplyLeading: false,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            text: AppStrings.gold,
            onPressed: () {
              Navigator.pushNamed(context, '/goldtracker');
            },
            color: AppColors.goldColor,
          ),
          SizedBox(height: 20),
          CustomButton(
            text: AppStrings.silver,
            onPressed: () {
              Navigator.pushNamed(context, '/silvertracker');
            },
            color: AppColors.sliverColor,
          ),
        ],
      ),
    );
  }
}
