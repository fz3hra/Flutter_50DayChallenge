import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/utils/extensions.dart';
import 'package:flutter_finance_dashboard/features/feature_exports.dart';

class HomeFeature extends StatelessWidget {
  const HomeFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: const MainSidebarWidget(),
              ).addMainMarginLayout(
                const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: const DashboardWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
