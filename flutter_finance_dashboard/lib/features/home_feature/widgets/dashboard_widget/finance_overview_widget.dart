import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:flutter_finance_dashboard/features/feature_exports.dart';
import 'package:gap/gap.dart';

class FinanceOverviewWidget extends StatelessWidget {
  final FinanceModel finance;
  const FinanceOverviewWidget({
    required this.finance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      width: 200,
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                finance.icon,
                width: 16,
              ),
              const Gap(8),
              Text(
                finance.financeName,
                style:
                    const TextStyle().inter.bold.sized(12).colored(Colors.grey),
              ),
            ],
          ),
          const Gap(14),
          Row(
            children: [
              Text(
                r'$' + finance.amount,
                style: const TextStyle().inter.bold.sized(14),
              ),
              const Gap(8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: finance.hasIncreased == true
                      ? Colors.green[50]
                      : Colors.red[50],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    finance.hasIncreased == true
                        ? const Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                            size: 12,
                          )
                        : const Icon(
                            Icons.arrow_downward,
                            color: Colors.red,
                            size: 12,
                          ),
                    Text(
                      "${finance.percentage}%",
                      style: TextStyle().inter.bold.sized(10).colored(
                          finance.hasIncreased == true
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              Text(
                finance.hasIncreased == true
                    ? "+" + r'$' + finance.changedAmount
                    : "-" + r'$' + finance.changedAmount,
                style: const TextStyle().inter.bold.sized(10).colored(
                    finance.hasIncreased == true ? Colors.green : Colors.red),
              ),
              Text(
                'than last month',
                style:
                    const TextStyle().inter.bold.sized(10).colored(Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
