import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class PowerCard extends StatelessWidget {
  final String power;

  const PowerCard({
    super.key,
    required this.power,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(
          AppSizes.largeRadius,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Power',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            power,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

