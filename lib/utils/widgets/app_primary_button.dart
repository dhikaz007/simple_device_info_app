import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const AppPrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          AppColor.primaryGreen,
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(AppSpacing.space16),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.radius32),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppColor.primaryWhite),
      ),
    );
  }
}
