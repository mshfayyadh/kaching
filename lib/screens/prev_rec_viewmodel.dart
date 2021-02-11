import 'package:flutter/material.dart';
import 'package:ka_ching/models/expense.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/services/past_service.dart';

class PrevViewModel extends ChangeNotifier {
  PastService dataService;
  Map<String, double> incomes;
  Map<String, double> expenses;
  List<Income> ilist;
  List<Expense> elist;

  Future<void> getIncomeList(String months) async {
    if (months == null) return;
    ilist = await dataService.getIncomeList(months: months);
    for (int i = 0; i < ilist.length; i++) {
      incomes.putIfAbsent(
          ilist.elementAt(0).details, () => ilist.elementAt(0).value);
    }
    notifyListeners();
  }

  Future<void> getExpenseList(String months) async {
    if (months == null) return;
    elist = await dataService.getExpenseList(months: months);
    for (int i = 0; i < elist.length; i++) {
      expenses.putIfAbsent(
          elist.elementAt(0).details, () => elist.elementAt(0).value);
    }
    notifyListeners();
  }
}
