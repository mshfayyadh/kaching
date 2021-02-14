import 'package:flutter/material.dart';
import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/services/prev_service.dart';
import 'package:provider/provider.dart';
import 'package:ka_ching/models/profile_data.dart';
import 'package:ka_ching/screens/viewmodel/prev_rec_viewmodel.dart';

import '../view.dart';
import 'dashboard.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/models/expense.dart';

final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
final int currMonth = new DateTime.now().month;

class PreviousRec extends StatefulWidget {
  @override
  _PreviousRecState createState() => _PreviousRecState();
}

class _PreviousRecState extends State<PreviousRec> {
  final i = Income();
  final e = Expense();
  int type = 1;
  
  String dropdownValue = months.elementAt(currMonth - 1);

  @override
  Widget build(BuildContext context) {
    return SelectorView<PrevViewModel, dynamic>(
      initViewmodel: (viewmodel) {viewmodel.init();viewmodel.getExpenseList(dropdownValue);viewmodel.getIncomeList(dropdownValue);},
      selector: (_, viewmodel) => viewmodel.busy ? 0 : dropdownValue,
      builder: (context,viewmodel,_) {
        
        final e = viewmodel.expenses;
        final i = viewmodel.incomes;
        if(e==null)
          return Text('gagal');

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: DropdownButton(
                value: dropdownValue,
                items: months.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String newValue) {
                  (newValue != dropdownValue)
                      ? setState(() {
                          dropdownValue = newValue;
                          viewmodel.getExpenseList(dropdownValue);
                          viewmodel..getIncomeList(dropdownValue);
                          //type++;
                        })
                      : setState(() {});
                }),
          ),
          body: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [buildContainer("Incomes", i)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [buildContainer("Expenses", e)],
                  ),
                  // SelectorView<PrevViewModel, dynamic>(
                  //   initViewmodel: (viewmodel) {viewmodel.getExpenseList(dropdownValue); viewmodel.getIncomeList(dropdownValue);},
                  //   selector: (_, viewmodel) => viewmodel.busy ? 0 : dropdownValue,
                  //   builder: (context,viewmodel,_) {
                  //     final e = viewmodel.expenses;
                  //     final i = viewmodel.incomes;
                  //     if(e==null)
                  //       return Text('gagal');
                        
                  //     return Column(
                  //       children: [
                  //         Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [buildContainer("Expenses", e)],
                  //         ),
                  //         Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [buildContainer("Incomes", i)],
                  //         )
                  //       ]
                  //     );
                  //   }
                  // ),
                ]
              )
          );
      }
    );
  }

  Container buildContainer(String caption, Map chart) {
    return Container(
      width: 380,
      height: 250,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListTile(
            title: Text(caption,
                style: TextStyle(
                    height: 1, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 10,
          ),
          chart.isNotEmpty ? pieChart(dataMap: chart) : Text('No data',textAlign: TextAlign.start,)
        ]),
      ),
    );
  }
}
