import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:flutter_finance_dashboard/core/utils/extensions.dart';
import 'package:gap/gap.dart';

class SubcategoryTextWidget extends StatelessWidget {
  final String subcategoryName, icon;
  const SubcategoryTextWidget({
    required this.subcategoryName,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 20,
          color: Colors.grey,
        ),
        const Gap(8),
        Text(
          subcategoryName,
          style: TextStyle().inter.semiBold.colored(Colors.grey),
        ),
      ],
    ).addPadding();
  }
}
