import 'package:flutter/material.dart';
import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/screens/viewmodel.dart';
import 'package:ka_ching/services/prev_service.dart';

class PrevViewModel extends Viewmodel {
  PastService get dataService => dependency();
  Map<String, double> incomes;
  Map<String, double> expenses;
  List<Income> ilist;
  List<Expense> elist;
  double totalIncome;
  double totalExpense;

  void init() {
    incomes = { };
    expenses = { };
    totalExpense = 0;
    totalIncome = 0;
  }

  void getIncomeList(String months) async {
    if (months == null) return;

    turnBusy();
    ilist = await dataService.getIncomeList(months: months);
    
    ilist.forEach((customer) => incomes[customer.details.toString()] = customer.value.toDouble());
      
    // notifyListeners();
    turnIdle();
  }

  void getExpenseList(String months) async {
    if (months == null) return;

    turnBusy();
    elist = await dataService.getExpenseList(months: months);

    elist.forEach((customer) => expenses[customer.details.toString()] = customer.value.toDouble());

    turnIdle();
  }

  double getBalance(){
    totalIncome = 0;
    totalExpense = 0;

    elist.forEach((e) => totalExpense = totalExpense + e.value.toDouble());
    ilist.forEach((i) => totalIncome = totalIncome + i.value.toDouble());

    return (totalIncome-totalExpense);
  }
}
