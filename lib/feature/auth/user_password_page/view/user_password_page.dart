import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../../../utils/constants/app_color.dart';
import '../../../../utils/constants/app_spacing.dart';
import '../../../home_page/view/home_page.dart';

class UserPasswordPage extends StatelessWidget {
  const UserPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height - 100,
                  child: FlutterLogin(
                    title: 'Welcome',
                    theme: LoginTheme(
                      pageColorDark: Theme.of(context).scaffoldBackgroundColor,
                      buttonTheme: const LoginButtonTheme(
                        backgroundColor: AppColor.primaryGreen,
                      ),
                      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    hideForgotPasswordButton: true,
                    savedEmail: 'user@example.com',
                    savedPassword: '12345678',
                    onLogin: (p0) {
                      return null;
                    },
                    onRecoverPassword: (p0) {
                      return null;
                    },
                    onSubmitAnimationCompleted: () =>
                        Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
