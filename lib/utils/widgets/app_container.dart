import 'package:flutter/material.dart';

import '../../../../utils/constants/app_color.dart';
import '../../../../utils/constants/app_radius.dart';
import '../../../../utils/constants/app_spacing.dart';

class AppContainer extends StatelessWidget {
  final double? width;
  final double height;
  final Widget? child;
  const AppContainer({
    super.key,
     this.width,
    required this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space16),
      width: width ?? MediaQuery.sizeOf(context).width,
      height: height,
      decoration: BoxDecoration(
        color: AppColor.primaryWhite,
        borderRadius: BorderRadius.circular(AppRadius.radius8),
      ),
      child: child,
    );
  }
}
