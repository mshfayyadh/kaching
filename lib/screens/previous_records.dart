import 'package:flutter/material.dart';

import 'dashboard.dart';

class PreviousRec extends StatefulWidget {
  @override
  _PreviousRecState createState() => _PreviousRecState();
}

class _PreviousRecState extends State<PreviousRec> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [Container(
        child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 380,
                        height: 250,
                        child: 
                        RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      ),
          ]
    );
  }
}