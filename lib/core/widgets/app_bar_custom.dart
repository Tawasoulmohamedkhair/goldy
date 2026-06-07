import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    this.color2 = AppColors.white,
    this.automaticallyImplyLeading = true,
    this.fontsize = 20,
    this.fontWeight = FontWeight.bold,
    this.color3 = AppColors.white,
  });

  final String title;
  final Color color2;
    final Color color3;

  final double fontsize;
  final FontWeight fontWeight;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme:  IconThemeData(
        color: color3, 
      ),
      backgroundColor: AppColors.navBlue,
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color2,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
