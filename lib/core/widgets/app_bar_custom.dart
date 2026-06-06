import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    required this.color,
    this.color2 = Colors.white,
    this.automaticallyImplyLeading = true,
    this.fontsize = 20,
    this.fontWeight = FontWeight.bold,
  });

  final String title;
  final Color color;
  final Color color2;
  final double fontsize;
  final FontWeight fontWeight;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
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
