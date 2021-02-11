import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/models/expense.dart';

class PreviousRec extends StatefulWidget {
  @override
  _PreviousRecState createState() => _PreviousRecState();
}

class _PreviousRecState extends State<PreviousRec> {
  final i = Income();
  final e = Expense();
  int type = 1;
  String dropdownValue = "January";
  List<String> months =
  ['January', 'February','March', 'April','May', 'June','July', 'August','September', 'October','November', 'December'];
  int currMonth = new DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: DropdownButton(
            value: months.elementAt(currMonth-1),
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
              children: [
                buildContainer("Expenses",e.expense())
              ],
            ),
            Divider(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildContainer("Incomes",i.income())
              ],
            ),
          ]
      ),   
    );
  }

  Container buildContainer(String caption,Map type) {
    return Container(
      width: 380,
      height: 250,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
          //color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(caption, style: TextStyle(height: 1, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10,),
              pieChart(dataMap: type),
            ]
          ),
      ),
    );
  }
}