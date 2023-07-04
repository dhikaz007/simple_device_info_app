import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_color.dart';
import '../../../utils/constants/app_spacing.dart';
import '../../../utils/widgets/app_container.dart';
import '../model/barcode_model.dart';
import '../view_model/barcode_provider.dart';

class BarcodePage extends StatefulWidget {
  const BarcodePage({super.key});

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  final TextEditingController barcodeController = TextEditingController();

  @override
  void dispose() {
    barcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space16,
          vertical: AppSpacing.space4,
        ),
        child: Column(
          children: [
            AppContainer(
              height: 270,
              child: Column(
                children: <Widget>[
                  TextField(
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColor.primaryGray,
                        ),
                    controller: barcodeController,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.primaryGray,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.primaryGray,
                        ),
                      ),
                      labelText: 'Enter barcode data',
                      labelStyle:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColor.primaryGray,
                              ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space12),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.primaryGreen),
                    ),
                    onPressed: () {
                      final String barcode = barcodeController.text;

                      Provider.of<BarcodeProvider>(context, listen: false)
                          .barcodeData = BarcodeModel(barcode: barcode);
                    },
                    child: Text(
                      'Generate Barcode',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColor.primaryWhite,
                          ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space12),
                  Consumer<BarcodeProvider>(
                    builder: (context, value, _) {
                      if (value.barcodeModel == null) {
                        return Container();
                      } else {
                        return BarcodeWidget(
                          barcode: Barcode.code128(),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColor.primaryGray,
                                  ),
                          data: value.barcodeModel?.barcode ?? '',
                          width: 200,
                          height: 100,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
