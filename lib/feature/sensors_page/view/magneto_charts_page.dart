import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/constants/app_color.dart';
import '../../../utils/constants/app_radius.dart';
import '../../../utils/constants/app_spacing.dart';
import '../model/magnetometer_model.dart';
import '../view_model/magnetometer_provider.dart';

class MagnetoChartsPage extends StatelessWidget {
  const MagnetoChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final magnetometerProvider = MagnetometerProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetometer with charts'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space20,
          vertical: AppSpacing.space4,
        ),
        child: Consumer<MagnetometerProvider>(
          builder: (_, provider, __) {
            final dataMagneto = provider.dataList;
            if (dataMagneto.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Magnetometer',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColor.primaryGreen,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.space12),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: AppRadius.radius4,
                        backgroundColor: Colors.red,
                      ),
                      const SizedBox(width: AppSpacing.space4),
                      Text(
                        'x : ${dataMagneto.last.x.toStringAsFixed(3)} µT',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColor.primaryWhite,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space4),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: AppRadius.radius4,
                        backgroundColor: Colors.blue,
                      ),
                      const SizedBox(width: AppSpacing.space4),
                      Text(
                        'y : ${dataMagneto.last.y.toStringAsFixed(3)} µT',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColor.primaryWhite,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space4),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: AppRadius.radius4,
                        backgroundColor: Colors.purple,
                      ),
                      const SizedBox(width: AppSpacing.space4),
                      Text(
                        'z : ${dataMagneto.last.z.toStringAsFixed(3)} µT',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColor.primaryWhite,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space12),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: [
                        LineSeries<MagnetometerModel, double>(
                          dataSource: dataMagneto,
                          name: 'X',
                          color: Colors.red,
                          xValueMapper: (point, _) =>
                              num.tryParse(point.x.toStringAsFixed(3))
                                  ?.toDouble(),
                          yValueMapper: (point, _) => point.y,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: [
                        LineSeries<MagnetometerModel, double>(
                          dataSource: dataMagneto,
                          name: 'Y',
                          color: Colors.blue,
                          xValueMapper: (point, _) =>
                              num.tryParse(point.y.toStringAsFixed(3))
                                  ?.toDouble(),
                          yValueMapper: (point, _) => point.z,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: [
                        LineSeries<MagnetometerModel, double>(
                          dataSource: dataMagneto,
                          name: 'Z',
                          color: Colors.purple,
                          xValueMapper: (point, _) =>
                              num.tryParse(point.z.toStringAsFixed(3))
                                  ?.toDouble(),
                          yValueMapper: (point, _) => point.x,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryGreen,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
