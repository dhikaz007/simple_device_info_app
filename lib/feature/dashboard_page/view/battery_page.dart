import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/app_color.dart';
import '../../../utils/constants/app_spacing.dart';
import '../../../utils/widgets/app_container.dart';
import '../view_model/battery_provider.dart';
import 'widget/battery_content_widget.dart';

class BatteryPage extends StatelessWidget {
  const BatteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final batteryProv = BatteryProvider.of(context);
    return InkWell(
      onTap: () => batteryDialogBox(context, batteryProv),
      child: AppContainer(
        height: 120,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 10,
              child: Text(
                'Battery',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.green,
                    ),
              ),
            ),
            Positioned(
              top: 30,
              left: 0,
              child: SvgPicture.asset(
                'assets/icon/svg/battery_icon.svg',
                width: 64,
                height: 64,
                colorFilter: const ColorFilter.mode(
                  Colors.green,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 68,
              child: Text(
                '${batteryProv.dataList.first.batteryLevel} %',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
            Positioned(
              bottom: 25,
              left: 68,
              child: Text(
                '${batteryProv.dataList.first.temperature} °C',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 68,
              child: Text(
                '${batteryProv.dataList.first.health?.toUpperCase()}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> batteryDialogBox(
    BuildContext context,
    BatteryProvider batteryProv,
  ) {
    return showDialog(
      barrierDismissible: false,
      barrierLabel: 'Close',
      context: context,
      builder: (context) => AlertDialog(
        icon: Wrap(
          spacing: AppSpacing.space8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icon/svg/battery_icon.svg',
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                AppColor.primaryGreen,
                BlendMode.srcIn,
              ),
            ),
            Text(
              'Battery',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColor.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        title: Container(
          width: double.infinity,
          height: 1,
          color: Colors.green,
        ),
        content: SizedBox(
          width: 100,
          height: 196,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BatteryContentWidget(
                title: 'Battery Level',
                content: '${batteryProv.dataList.last.batteryLevel} %',
              ),
              const SizedBox(height: AppSpacing.space8),
              BatteryContentWidget(
                title: 'Temperature',
                content: '${batteryProv.dataList.last.temperature} °C',
              ),
              const SizedBox(height: AppSpacing.space8),
              BatteryContentWidget(
                title: 'Technology',
                content: '${batteryProv.dataList.last.technology}',
              ),
              const SizedBox(height: AppSpacing.space8),
              BatteryContentWidget(
                title: 'Health',
                content: '${batteryProv.dataList.last.health}',
              ),
              const SizedBox(height: AppSpacing.space8),
              BatteryContentWidget(
                title: 'Voltage',
                content: '${batteryProv.dataList.last.voltage} V',
              ),
              const SizedBox(height: AppSpacing.space8),
              BatteryContentWidget(
                title: 'Current',
                content: '${batteryProv.dataList.last.currentNow} mA',
              ),
              const SizedBox(height: AppSpacing.space8),
              BatteryContentWidget(
                title: 'Capacity',
                content: '${batteryProv.dataList.last.batteryCapacity}',
              ),
              const SizedBox(height: AppSpacing.space8),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
