import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:flutter_finance_dashboard/features/feature_exports.dart';
import 'package:gap/gap.dart';

class MainSidebarWidget extends StatelessWidget {
  const MainSidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "CloudFinance",
              style: const TextStyle().inter.bold.sized(20),
            ),
            const Gap(36),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategoryTextWidget(
                    categoryName: 'MENU',
                  ),
                  const Gap(16),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: SubcategoryTextWidget(
                      subcategoryName: 'Overview',
                      icon: IconConstants.dashboardIcon,
                    ),
                  ),
                  SubcategoryTextWidget(
                    subcategoryName: 'Statistics',
                    icon: IconConstants.statisticsIcon,
                  ),
                  SubcategoryTextWidget(
                    subcategoryName: 'Savings',
                    icon: IconConstants.savingsIcon,
                  ),
                  SubcategoryTextWidget(
                    subcategoryName: 'Portfolios',
                    icon: IconConstants.portfolioIcon,
                  ),
                  SubcategoryTextWidget(
                    subcategoryName: 'Messages',
                    icon: IconConstants.messageIcon,
                  ),
                  SubcategoryTextWidget(
                    subcategoryName: 'Transactions',
                    icon: IconConstants.transactionsIcon,
                  ),
                ],
              ),
            ),
            const Gap(24),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryTextWidget(
                    categoryName: 'GENERAL',
                  ),
                  const Gap(16),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: SubcategoryTextWidget(
                      subcategoryName: 'Settings',
                      icon: IconConstants.settingsIcon,
                    ),
                  ),
                  SubcategoryTextWidget(
                    subcategoryName: 'Appearances',
                    icon: IconConstants.appearancesIcon,
                  ),
                  SubcategoryTextWidget(
                    subcategoryName: 'Need Help?',
                    icon: IconConstants.needHelpIcon,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SubcategoryTextWidget(
              subcategoryName: 'Logout',
              icon: IconConstants.logoutIcon,
            ),
          ],
        ),
      ),
    );
  }
}
