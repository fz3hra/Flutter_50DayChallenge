import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:flutter_finance_dashboard/features/feature_exports.dart';
import 'package:gap/gap.dart';

class SavingBreakdownWidget extends StatelessWidget {
  final SavingsModel saving;
  const SavingBreakdownWidget({
    required this.saving,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                saving.savingsName,
                style: const TextStyle().inter.bold.sized(12),
              ),
            ),
            Text(
              r'$' + saving.initialSaving,
              style: const TextStyle().inter.bold.sized(12),
            ),
            Text(
              "/",
              style: const TextStyle().inter.normal.sized(12),
            ),
            Text(
              r'$' + saving.totalSaving,
              style: const TextStyle().inter.normal.sized(12),
            ),
          ],
        ),
        const Gap(8),
        SizedBox(
          height: 8,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            child: LinearProgressIndicator(
              backgroundColor: const Color.fromARGB(255, 240, 237, 237),
              color: const Color.fromARGB(255, 22, 131, 221),
              value: calculateSavings(
                double.parse(saving.initialSaving),
                double.parse(saving.totalSaving),
              ),
            ),
          ),
        ),
        const Gap(24),
      ],
    );
  }

  double calculateSavings(double initialSaving, double totalSaving) {
    double amount = initialSaving / totalSaving;
    return amount;
  }
}
