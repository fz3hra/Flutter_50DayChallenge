import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:gap/gap.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Transactions",
                style: TextStyle().inter.bold.sized(20),
              ),
              Text(
                "View all",
                style: TextStyle().inter.bold.sized(12).colored(Colors.blue),
              ),
            ],
          ),
          const Gap(16),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onChanged: (bool? value) {},
                    value: false,
                  ),
                ),
                const DataColumn(
                  label: Text('To/From'),
                ),
                const DataColumn(
                  label: Text('Date'),
                ),
                const DataColumn(
                  label: Text('Description'),
                ),
                const DataColumn(
                  label: Text('Amount'),
                ),
                const DataColumn(
                  label: Text('Status'),
                ),
                const DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Row(
                        children: [
                          Text(
                            'Elevate Agency',
                            style: const TextStyle().inter.bold.sized(12),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
