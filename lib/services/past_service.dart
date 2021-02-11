import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';

import 'rest_service.dart';

class PastService {
  final rest = RestService();

  Future<List<Income>> getIncomeList({String months}) async {
    final listJson = await rest.get('incomes?months=$months');

    return (listJson as List)
        .map((itemJson) => Income.fromJson(itemJson))
        .toList();
  }

  Future<List<Expense>> getExpenseList({String months}) async {
    final listJson = await rest.get('expenses?months=$months');

    return (listJson as List)
        .map((itemJson) => Expense.fromJson(itemJson))
        .toList();
  }
}
