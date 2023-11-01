class FinanceModel {
  final String financeName, amount, changedAmount, icon, percentage;
  final bool hasIncreased;
  FinanceModel({
    required this.financeName,
    required this.amount,
    required this.changedAmount,
    required this.hasIncreased,
    required this.icon,
    required this.percentage,
  });
}
