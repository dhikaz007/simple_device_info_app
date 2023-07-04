import 'package:flutter/material.dart';

import '../../../../utils/constants/app_color.dart';

class SystemContentWidget extends StatelessWidget {
  final String title;
  final String value;
  const SystemContentWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.primaryGreen,
                fontWeight: FontWeight.normal,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.primaryGray,
                fontWeight: FontWeight.normal,
              ),
        ),
      ],
    );
  }
}
