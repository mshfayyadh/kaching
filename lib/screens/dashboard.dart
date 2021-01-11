import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class dashboardScreen extends StatefulWidget {
  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
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
          child: Card(
            child: Column(
              children: [
                ListTile(
                    title: Text(
                  'Your balance ',
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
                    Container(
                      width: 190,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xFFF5F6F9),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text('Income',
                                style: TextStyle(height: 1.5, fontSize: 12)),
                            Text('RM 0.00',
                                style: TextStyle(height: 1.5, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xFFF5F6F9),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Text('Expenses',
                                style: TextStyle(height: 1.5, fontSize: 12)),
                            Text('RM 0.00',
                                style: TextStyle(height: 1.5, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 380,
                      height: 250,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xFFF5F6F9),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ListTile(
                              title: Text('Expenses',
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            pieChart(dataMap: dataMap),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 380,
                      height: 250,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xFFF5F6F9),
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text('Income',
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            pieChart(dataMap: dataMap),
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
              onTap: () {},
            ),
            Divider(),
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
      chartLegendSpacing: 32,
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
