import 'package:flutter/material.dart';

import '../../../utils/constants/app_spacing.dart';
import '../../../utils/widgets/app_container.dart';
import 'accelerometer_main.dart';
import 'gyroscopemeter_main.dart';
import 'magnetometer_main.dart';
import 'widget/sensor_content_widget.dart';

class SensorsPage extends StatelessWidget {
  const SensorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space16,
          vertical: AppSpacing.space4,
        ),
        child: Column(
          children: [
            AppContainer(
              height: 100,
              child: SensorContentWidget(
                title: 'Magnetic field',
                subtitle: 'Magnetometer',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MagnetometerMain(),
                )),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
            AppContainer(
              height: 100,
              child: SensorContentWidget(
                title: 'Gyroscope',
                subtitle: 'Gyroscope',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GyroscopemeterMain(),
                )),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
            AppContainer(
              height: 100,
              child: SensorContentWidget(
                title: 'Accelerometer',
                subtitle: 'Accelerometer',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AccelerometerMain(),
                )),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
