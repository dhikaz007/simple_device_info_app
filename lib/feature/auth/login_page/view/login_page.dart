import 'package:flutter/material.dart';

import '../../../../utils/constants/app_color.dart';
import '../../../../utils/constants/app_spacing.dart';
import '../../../../utils/widgets/app_primary_button.dart';
import '../../biometrics_page/view/biometric_main.dart';
import '../../mobile_scanner_page/view/mobile_scanner_main.dart';
import '../../user_password_page/view/user_password_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'Choose Login Method',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColor.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              AppPrimaryButton(
                title: 'Login with Username and Password',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserPasswordPage(),
                )),
              ),
              const SizedBox(height: AppSpacing.space16),
              AppPrimaryButton(
                title: 'Login with NFC',
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.space16),
              AppPrimaryButton(
                title: 'Login with Fingerprint',
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BiometricMain(),
                )),
              ),
              const SizedBox(height: AppSpacing.space16),
              AppPrimaryButton(
                title: 'Login with QR Code',
                onPressed: () =>Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MobileScannerMain(),
                )),
              ),
              const SizedBox(height: AppSpacing.space16),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
