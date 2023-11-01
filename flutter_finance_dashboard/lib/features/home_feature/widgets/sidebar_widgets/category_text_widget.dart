import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/utils/extensions.dart';

class CategoryTextWidget extends StatelessWidget {
  final String categoryName;
  const CategoryTextWidget({
    required this.categoryName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      categoryName,
      style: TextStyle().inter.semiBold,
    );
  }
}
