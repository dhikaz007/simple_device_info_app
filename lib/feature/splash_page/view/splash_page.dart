import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utils/constants/app_color.dart';
import '../../../utils/constants/app_spacing.dart';
import '../../auth/login_page/view/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const LoginPage()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Simple Device Info App',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColor.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSpacing.space24),
            Image.asset(
              'assets/icon/png/device_info_logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: AppSpacing.space24),
            const CircularProgressIndicator(
              color: AppColor.primaryGreen,
            ),
            const SizedBox(height: AppSpacing.space24),
            Text(
              'Please Wait',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColor.primaryGray,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
