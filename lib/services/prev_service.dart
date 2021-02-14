import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';

import 'rest_service.dart';

class PastService {
  final rest = dependency<RestService>();

  Future<List<Income>> getIncomeList({String months}) async {
    final listJson = await rest.get('incomes?month=$months');

    return (listJson as List)
        .map((itemJson) => Income.fromJson(itemJson))
        .toList();
  }

  Future<List<Expense>> getExpenseList({String months}) async {
    final listJson = await rest.get('expenses?month=$months');

    return (listJson as List)
        .map((itemJson) => Expense.fromJson(itemJson))
        .toList();
  }
}
