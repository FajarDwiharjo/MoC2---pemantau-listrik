import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class PhaseCard extends StatelessWidget {
  final String phase;
  final String voltage;
  final String current;
  final VoidCallback? onTap;

  const PhaseCard({
    super.key,
    required this.phase,
    required this.voltage,
    required this.current,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        AppSizes.smallRadius,
      ),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(
          AppSizes.md,
        ),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(
            AppSizes.smallRadius,
          ),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              phase,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Voltage : $voltage',
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              'Current : $current',
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

