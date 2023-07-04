import 'package:flutter/material.dart';

import '../../../utils/constants/app_color.dart';
import '../../../utils/constants/app_spacing.dart';
import '../../../utils/widgets/app_container.dart';
import '../view_model/battery_provider.dart';
import 'battery_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    final batteryProvider = BatteryProvider.of(context, listen: false);
    batteryProvider.startListening();
  }

  @override
  void dispose() {
    final batteryProvider = BatteryProvider.of(context, listen: false);
    batteryProvider.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space16,
          vertical: AppSpacing.space4,
        ),
        child: Column(
          children: [
            AppContainer(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Local Time',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColor.primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.space4),
                  Text(
                    '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} (GMT${DateTime.now().timeZoneName})',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColor.primaryGreen,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.space4),
                  StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) => Text(
                      '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColor.primaryGreen,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space12),
            const BatteryPage()
          ],
        ),
      ),
    );
  }
}
