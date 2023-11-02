import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:flutter_finance_dashboard/features/feature_exports.dart';
import 'package:gap/gap.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle().inter.bold.sized(16),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 280,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                              ),
                              hintText: 'Search Here',
                              hintStyle: const TextStyle().inter.sized(14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              // enabledBorder: InputBorder.none,
                              // focusedBorder: InputBorder.none,
                              filled: true,
                              fillColor: Color(0xFFF9F9FB),
                            ),
                          ),
                        ),
                        const Gap(8),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9FB),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(Icons.notifications_none_outlined),
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            ClipOval(
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  "assets/my_logo.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Gap(8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Graham Alexander",
                                  style: TextStyle().inter.bold.sized(12),
                                ),
                                Gap(4),
                                Text(
                                  "Graham@gmail.com",
                                  style: TextStyle()
                                      .inter
                                      .bold
                                      .sized(10)
                                      .colored(Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ).addMainMarginLayout(
                ColorConstants.primaryColor,
              ),
              Container(
                height: size.height,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overview",
                      style: TextStyle().inter.bold.sized(20),
                    ),
                    const Gap(16),
                    Row(
                      children: FinanceService.listOfFinances
                          .map(
                            (finance) => FinanceOverviewWidget(
                              finance: finance,
                            ),
                          )
                          .toList(),
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstants.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 340,
                            child: StatisticsWidget(),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: SavingsInfoWidget(),
                        ),
                      ],
                    ),
                    // !transactions
                    const Gap(16),
                    const TransactionWidget(),
                  ],
                ),
              ).addMainMarginLayout(
                const Color.fromRGBO(246, 246, 248, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
