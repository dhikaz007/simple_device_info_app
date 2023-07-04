import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_color.dart';
import '../../../utils/constants/app_spacing.dart';
import '../../../utils/widgets/app_container.dart';
import '../view_model/system_provider.dart';
import 'widget/system_content_widget.dart';

class SystemPage extends StatelessWidget {
  const SystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space16,
          vertical: AppSpacing.space4,
        ),
        child: Consumer<SystemProvider>(
          builder: (context, value, _) => Column(
            children: [
              AppContainer(
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Device',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColor.primaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    if (value.deviceInfo != null) ...[
                      SystemContentWidget(
                        title: 'Device Name',
                        value: '${value.deviceInfo?.deviceName}',
                      ),
                      SystemContentWidget(
                        title: 'Model',
                        value: '${value.deviceInfo?.deviceModel}',
                      ),
                      SystemContentWidget(
                        title: 'Product',
                        value: '${value.deviceInfo?.deviceProduct}',
                      ),
                      SystemContentWidget(
                        title: 'Device',
                        value: '${value.deviceInfo?.deviceBuild}',
                      ),
                      SystemContentWidget(
                        title: 'Board',
                        value: '${value.deviceInfo?.deviceBoard}',
                      ),
                      SystemContentWidget(
                        title: 'Manufacturer',
                        value: '${value.deviceInfo?.deviceManufacturer}',
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.space8),
              AppContainer(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Operating System',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColor.primaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    if (value.deviceInfo != null) ...[
                      SystemContentWidget(
                        title: 'Android Version',
                        value: '${value.deviceInfo?.deviceOSVersion}',
                      ),
                      SystemContentWidget(
                        title: 'API',
                        value: '${value.deviceInfo?.deviceSDKVersion}',
                      ),
                      SystemContentWidget(
                        title: 'Android Version Code',
                        value: '${value.deviceInfo?.deviceVersionCode}',
                      ),
                      SystemContentWidget(
                        title: 'Security Patch',
                        value: '${value.deviceInfo?.deviceSecurityPatch}',
                      ),
                      SystemContentWidget(
                        title: 'Architecture',
                        value: '${value.deviceInfo?.supportedAbis}',
                      ),
                      SystemContentWidget(
                        title: 'Instruction Sets',
                        value: '${value.deviceInfo?.supported32BitAbis}',
                      ),
                      SystemContentWidget(
                        title: 'Instruction Sets 64',
                        value: '${value.deviceInfo?.supported64BitAbis}',
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
