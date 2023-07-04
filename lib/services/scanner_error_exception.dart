import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../utils/constants/app_color.dart';
import '../utils/constants/app_spacing.dart';

class ScannerErrorException extends StatelessWidget {
  final MobileScannerException error;
  const ScannerErrorException({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
        break;
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
        break;
      default:
        errorMessage = 'Generic Error';
        break;
    }

    return ColoredBox(
      color: AppColor.primaryGreen,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.space16),
              child: Icon(Icons.error, color: AppColor.primaryWhite),
            ),
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.primaryWhite,
                  ),
            ),
            Text(
              error.errorDetails?.message ?? '',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.primaryWhite,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
