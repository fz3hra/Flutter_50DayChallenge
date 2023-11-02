import 'package:flutter/material.dart';
import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var formatter = NumberFormat('#,###,000');
    var formatTotalEarned = formatter.format(1500);
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
                DataColumn(
                  label: Text(
                    'To/From',
                    style: const TextStyle()
                        .inter
                        .bold
                        .sized(12)
                        .colored(Colors.grey),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Date',
                    style: const TextStyle()
                        .inter
                        .bold
                        .sized(12)
                        .colored(Colors.grey),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Description',
                    style: const TextStyle()
                        .inter
                        .bold
                        .sized(12)
                        .colored(Colors.grey),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Amount',
                    style: const TextStyle()
                        .inter
                        .bold
                        .sized(12)
                        .colored(Colors.grey),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Status',
                    style: const TextStyle()
                        .inter
                        .bold
                        .sized(12)
                        .colored(Colors.grey),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Action',
                    style: const TextStyle()
                        .inter
                        .bold
                        .sized(12)
                        .colored(Colors.grey),
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (bool? value) {},
                            value: false,
                          )
                        ],
                      ),
                    ),
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
                        children: [
                          Text(
                            '2 october 2023',
                            style: const TextStyle()
                                .inter
                                .bold
                                .sized(12)
                                .colored(Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          Text(
                            'Monthly Salary',
                            style: const TextStyle().inter.bold.sized(12),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          Text(
                            r'$' '$formatTotalEarned',
                            style: const TextStyle()
                                .inter
                                .bold
                                .sized(12)
                                .colored(Colors.green),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              'Success',
                              style: const TextStyle()
                                  .inter
                                  .bold
                                  .sized(12)
                                  .colored(Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const DataCell(
                      Row(
                        children: [
                          Icon(
                            Icons.attachment_rounded,
                            size: 20,
                          ),
                          Gap(8),
                          Icon(
                            Icons.delete_outline_rounded,
                            size: 20,
                          ),
                          Gap(8),
                          Icon(
                            Icons.more_horiz_rounded,
                            size: 20,
                          ),
                        ],
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
