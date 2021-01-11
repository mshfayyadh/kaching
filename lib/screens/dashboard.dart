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
        leading: IconButton(
          icon: const Icon(Icons.short_text),
          onPressed: () {},
        ),
        title: Text(
          'Hi, Afif Marzuki',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
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
                    height: 200,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text('Expenses',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          PieChart(dataMap: dataMap)
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
                    height: 200,
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
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
