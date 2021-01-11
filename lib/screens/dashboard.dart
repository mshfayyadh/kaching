import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:ka_ching/models/income.dart';
import 'package:ka_ching/models/expense.dart';

class dashboardScreen extends StatefulWidget {
  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  final i = Income();
  final e = Expense();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Hi, Afif Marzuki',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                  title: Text('Your balance ',
                    style: TextStyle(fontSize: 18),
              )),
              ListTile(
                  title: Text(
                    'RM 0.00',
                    style: TextStyle(
                      height: 0, fontSize: 40, fontWeight: FontWeight.bold),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer1("Income",0.00),
                  SizedBox(width:3),
                  buildContainer1("Expense",0.00),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer2("Expenses",e.expense())
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildContainer2("Incomes",i.income())
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 375,
                    height: 250,
                    child: RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text('Transaction',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                  CircleAvatar(),
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
              onTap: () {},
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {},
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

  Container buildContainer2(String caption,Map<String, double> chart) {
    return Container(
                    width: 375,
                    height: 250,
                    child: 
                    RaisedButton(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListTile(
                            title: Text(caption,
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          pieChart(dataMap: chart)
                        ],
                      ),
                    ),
                  );
  }

  Container buildContainer1(String caption,double value) {
    return Container(
      width: 180,
      child: RaisedButton(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        onPressed: () {},
        child: Column(
          children: [
            Text(caption, style: TextStyle(height: 1.5, fontSize: 12)),
            Text('RM ${value.toStringAsFixed(2)}', style: TextStyle(height: 1.5, fontSize: 20)),
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
      centerText: "December",
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
