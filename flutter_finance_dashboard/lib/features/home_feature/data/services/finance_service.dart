import 'package:flutter_finance_dashboard/core/core_exports.dart';
import 'package:flutter_finance_dashboard/features/home_feature/data/model/finance_model.dart';

class FinanceService {
  static List<FinanceModel> listOfFinances = [
    FinanceModel(
      financeName: 'Earnings',
      amount: '928.41',
      changedAmount: '118.8',
      hasIncreased: true,
      icon: IconConstants.earningIcon,
      percentage: '12.8',
    ),
    FinanceModel(
      financeName: 'Spendings',
      amount: '169.43',
      changedAmount: '5.2',
      hasIncreased: false,
      icon: IconConstants.spendingsIcon,
      percentage: '3.1',
    ),
    FinanceModel(
      financeName: 'Savings',
      amount: '406.27',
      changedAmount: '33.3',
      hasIncreased: true,
      icon: IconConstants.savingIcon,
      percentage: '8.2',
    ),
    FinanceModel(
      financeName: 'Investment',
      amount: '1854.08',
      changedAmount: '78.08',
      hasIncreased: true,
      icon: IconConstants.investmentIcon,
      percentage: '9.2',
    ),
  ];
}
