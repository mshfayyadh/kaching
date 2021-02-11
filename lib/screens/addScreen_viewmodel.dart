import 'package:flutter/foundation.dart';
import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/services/add_service.dart';

class AddScreenViewModel extends ChangeNotifier 
{
  AddService dataService;
  List<Income> incomes;
  List<Expense> expense;
  List<String> months = 
    ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  int currMonth = new DateTime.now().month;

  Future<void> addIncome({String details,double value}) async {
    String month = months.elementAt(currMonth-1);
    final newIncome = await dataService.addIncomes(
      i: Income(userId: 'user.id', details: details, value: value, month: month));
    incomes.add(newIncome);
    notifyListeners();
  }

  Future<void> addExpense({String details,double value}) async {
    String month = months.elementAt(currMonth);
    final newExpense = await dataService.addExpenses(
      e: Expense(userId: 'user.id', details: details, value: value, month: month));
    expense.add(newExpense);
    notifyListeners();
  }
}