import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/services/rest_service.dart';

class IEService 
{
  final rest = dependency<RestService>();

  Future<Income> addIncomes({Income i}) async {
    final json = await rest.post('incomes', data: i);

    return Income.fromJson(json);
  }

  Future<Expense> addExpenses({Expense e}) async {
    final json = await rest.post('expenses', data: e);

    return Expense.fromJson(json);
  }

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