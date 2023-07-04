import 'package:flutter/material.dart';

import '../../../utils/constants/app_color.dart';
import '../../barcode_page/view/barcode_main.dart';
import '../../dashboard_page/view/dashboard_main.dart';
import '../../sensors_page/view/sensors_page.dart';
import '../../system_page/view/system_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Device Info App',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColor.primaryWhite),
          ),
          bottom: TabBar(
            labelColor: AppColor.primaryWhite,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.primaryGreen.withOpacity(0.2),
            ),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            tabs: const [
              Tab(text: 'Dashboard'),
              Tab(text: 'System'),
              Tab(text: 'Barcode'),
              Tab(text: 'Sensors'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DashboardMain(),
            SystemMain(),
            BarcodeMain(),
            SensorsPage(),
          ],
        ),
      ),
    );
  }
}
