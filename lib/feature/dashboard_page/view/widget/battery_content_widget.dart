import 'package:flutter/material.dart';

import '../../../../utils/constants/app_color.dart';

class BatteryContentWidget extends StatelessWidget {
  final String title;
  final String content;
  const BatteryContentWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.primaryWhite,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          content,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.primaryWhite,
              ),
        ),
      ],
    );
  }
}
