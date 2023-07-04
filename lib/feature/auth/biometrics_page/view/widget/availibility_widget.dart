import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_color.dart';
import '../../../../../utils/constants/app_spacing.dart';

class AvailibilityWidget extends StatelessWidget {
  final String text;
  final bool checked;
  const AvailibilityWidget({
    super.key,
    required this.text,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
      child: Row(
        children: [
          checked
              ? const Icon(
                  Icons.check,
                  color: AppColor.primaryGreen,
                  size: 32,
                )
              : const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 32,
                ),
          const SizedBox(width: AppSpacing.space12),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColor.primaryWhite,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ],
      ),
    );
  }
}
