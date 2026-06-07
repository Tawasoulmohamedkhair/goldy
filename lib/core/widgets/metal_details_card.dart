import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_strings.dart';

class MetalDetailsCard extends StatelessWidget {
  final String name;
  final num price;
  final Color color;
  final String image;

  const MetalDetailsCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image.toString(), width: 100, height: 100),
          SizedBox(height: 20),
          Card(
            color: color,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        price.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 4),
                      Text(
                        AppStrings.coin,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
