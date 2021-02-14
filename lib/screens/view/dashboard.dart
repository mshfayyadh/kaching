import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ka_ching/screens/viewmodel/prev_rec_viewmodel.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/models/expense.dart';

import '../view.dart';

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

class dashboardScreen extends StatefulWidget {
  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  final i = Income();
  final e = Expense();
  final String month = months.elementAt(currMonth - 1);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Welcome to Ka-Ching',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Your balance ', style: TextStyle(fontSize: 18),)
              ),
              SelectorView<PrevViewModel,dynamic>(
                initViewmodel: (viewmodel) {viewmodel.init();viewmodel.getIncomeList(month);viewmodel.getExpenseList(month);}, 
                selector: (_, viewmodel) => viewmodel.busy ? 0 : {viewmodel.ilist.length,viewmodel.elist.length},
                builder: (context,viewmodel,_) {
                  
                  final balance = viewmodel.getBalance();
                  final tincome = viewmodel.totalIncome;
                  final texpense = viewmodel.totalExpense;
                  final e = viewmodel.expenses;
                  final i = viewmodel.incomes;

                  if(balance==null)
                    return Text("gagal");

                  return Column(
                    children: [
                      ListTile(
                        title: Text('RM '+balance.toStringAsFixed(2),style: TextStyle(height: 0, fontSize: 40, fontWeight: FontWeight.bold),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildContainer1("Income", tincome),
                          buildContainer1("Expense", texpense),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [buildContainer2("Incomes (${month})", i)],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [buildContainer2("Expenses (${month})", e)],
                      ),
                    ],
                  ); 
                } 
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn1.iconfinder.com/data/icons/circle-outlines-colored/512/User_Account_Person_Avatar_Profile_Man_Head-512.png"),
                  ),
                  SizedBox(height: 10),
                  Text('Afif Marzuki'),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.yellow[400],
              ),
            ),
            ListTile(
              title: Text('Previous Month Record'),
              onTap: () {
                Navigator.pushNamed(context, '/record');
              },
            ),
            Divider(color: Colors.black),
            ListTile(
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                Navigator.pushNamed(context, '/setting');
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[700],
          elevation: 10,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          }),
    );
  }

  Container buildContainer2(String caption, Map<String, double> chart) {
    return Container(
      width: 390,
      height: 270,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text(caption,
                  style: TextStyle(
                      height: 1, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            chart.isNotEmpty ? pieChart(dataMap: chart) : Text('No data',textAlign: TextAlign.start,)
          ],
        ),
      ),
    );
  }

  Container buildContainer1(String caption, double value) {
    return Container(
      width: 190,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //color: Colors.white,
        child: Column(
          children: [
            Text(caption, style: TextStyle(height: 1.5, fontSize: 12)),
            Text('RM ${value.toStringAsFixed(2)}',
                style: TextStyle(height: 1.5, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class pieChart extends StatelessWidget {
  const pieChart({
    Key key,
    @required this.dataMap,
  }) : super(key: key);

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 65,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      //centerText: "December",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true,
      ),
    );
  }
}
