import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:flutter_finance_dashboard/features/feature_exports.dart';
import 'package:gap/gap.dart';

class SavingsInfoWidget extends StatelessWidget {
  const SavingsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      height: 340,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Savings',
                style: TextStyle().inter.bold.colored(Colors.grey).sized(12),
              ),
              const Gap(12),
              Row(
                children: [
                  Text(
                    r'$' + '406.27',
                    style: TextStyle().inter.bold.sized(24),
                  ),
                  const Gap(8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                          size: 12,
                        ),
                        Text(
                          "8.2%",
                          style: TextStyle()
                              .inter
                              .bold
                              .sized(10)
                              .colored(Colors.green),
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
                    r'$' + '33.3 ',
                    style: const TextStyle()
                        .inter
                        .bold
                        .sized(10)
                        .colored(Colors.green),
                  ),
                  Text(
                    'than last month',
                    style: const TextStyle()
                        .inter
                        .bold
                        .sized(10)
                        .colored(Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: SavingsService.savings
                .map(
                  (saving) => SavingBreakdownWidget(
                    saving: saving,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
