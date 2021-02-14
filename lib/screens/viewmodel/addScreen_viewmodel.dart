import 'package:flutter/foundation.dart';
import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/screens/viewmodel.dart';
import 'package:ka_ching/services/add_service.dart';

List<String> months = 
    ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  int currMonth = new DateTime.now().month;

class AddScreenViewModel extends Viewmodel 
{
  AddService get dataService => dependency();
  List<Income> incomes;
  List<Expense> expense;
  String month = months.elementAt(currMonth-1);

  Future<void> addIncome({String details,double value}) async {
    turnBusy();
    final newIncome = await dataService.addIncomes(
      i: Income(userId: '1', details: details.toString(), value: value.toDouble(), month: month.toString()));
    //incomes.add(newIncome);
    // notifyListeners();
    turnIdle();
  }

  Future<void> addExpense({String details,double value}) async {
    turnBusy();
    final newExpense = await dataService.addExpenses(
      e: Expense(userId: '1', details: details.toString(), value: value.toDouble(), month: month.toString()));
    //expense.add(newExpense);
    // notifyListeners();
    turnIdle();
  }
}