import 'package:flutter/material.dart';

import '../../../../utils/constants/app_color.dart';
import '../../../../utils/constants/app_spacing.dart';

class SensorContentWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  const SensorContentWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColor.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSpacing.space4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.primaryGray,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_right,
            color: AppColor.primaryGray,
            size: 48,
          ),
        ),
      ],
    );
  }
}
