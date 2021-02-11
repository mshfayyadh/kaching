import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/services/rest_service.dart';

class AddService 
{
  final rest = RestService();

  Future<Income> addIncomes({Income i}) async {
    final json = await rest.post('incomes', data: i);

    return Income.fromJson(json);
  }

  Future<Expense> addExpenses({Expense e}) async {
    final json = await rest.post('expenses', data: e);

    return Expense.fromJson(json);
  }
}