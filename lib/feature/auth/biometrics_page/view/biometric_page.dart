import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import 'widget/availibility_widget.dart';
import '../view_model/biometric_provider.dart';
import '../../../home_page/view/home_page.dart';
import '../../../../services/local_auth_biometric.dart';
import '../../../../utils/constants/app_color.dart';
import '../../../../utils/constants/app_spacing.dart';
import '../../../../utils/widgets/app_primary_button.dart';

class BiometricPage extends StatelessWidget {
  const BiometricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space20,
            vertical: AppSpacing.space4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColor.primaryWhite,
                ),
              ),
              const Spacer(),
              Center(
                child: Consumer<BioMetricProvider>(
                  builder: (context, value, _) => AppPrimaryButton(
                    title: 'Check Availability',
                    onPressed: () async {
                      // value.checkBiometricAvailability();
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: Text(
                      //       'Availability',
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .titleLarge
                      //           ?.copyWith(
                      //             color: AppColor.primaryWhite,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //     ),
                      //     content: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         Text(
                      //             'Biometrics Status : ${value.status.name.}'),
                      //         AvailibilityWidget(
                      //           text: 'Biometrics',
                      //           checked:
                      //               value.status.name.contains('available'),
                      //         ),
                      //         // const SizedBox(height: AppSpacing.space8),
                      //         // AvailibilityWidget(
                      //         //     text: 'Fingerprint',
                      //         //     checked: hasFingerPrint),
                      //       ],
                      //     ),
                      //   ),
                      // );
                      final isAvailable =
                          await LocalAuthBiometric.hasBiometrics();
                      final biometrics =
                          await LocalAuthBiometric.getBiometrics();
                      final hasFingerPrint =
                          biometrics.contains(BiometricType.fingerprint);
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Availability',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: AppColor.primaryWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AvailibilityWidget(
                                  text: 'Biometrics',
                                  checked: isAvailable,
                                ),
                                const SizedBox(height: AppSpacing.space8),
                                AvailibilityWidget(
                                  text: 'Fingerprint',
                                  checked: hasFingerPrint,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.space16),
              Center(
                child: Consumer<BioMetricProvider>(
                  builder: (context, value, _) => AppPrimaryButton(
                    title: 'Login using fingerprint',
                    onPressed: () async {
                      // value.authenticate().then(
                      //       (value) => Navigator.of(context).pushAndRemoveUntil(
                      //           MaterialPageRoute(
                      //               builder: (context) => const HomePage()),
                      //           (route) => false),
                      //     );
                      await LocalAuthBiometric.autehnticate().then((value) {
                        if (value) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (route) => false);
                        } else {
                          return null;
                        }
                      });
                    },
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
