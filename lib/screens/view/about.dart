import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('About'),//, style: TextStyle(color: Colors.black)),
          //backgroundColor: Colors.white,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                child: Image(
                  height: 200,
                  width: 200,
                  image: AssetImage('assets/images/logo2.png'),
                ),
              ),
              Text(
                "Beta version",
                style: TextStyle(fontSize: 13.0),
              ),
              SizedBox(height: 80),
              Text(
                "Credit to:",
                style: TextStyle(fontSize: 13.0),
              ),
              Text(
                "Dr. Jumail Bin Taliba",
                style: TextStyle(fontSize: 13.0),
              ),
              SizedBox(height: 10),
              Text(
                "Developer:",
                style: TextStyle(fontSize: 13.0),
              ),
              SizedBox(height: 10),
              Text(
                "Afif Hafizin Bin Hamizan",
                style: TextStyle(fontSize: 13.0),
              ),
              Text(
                "Izzat Marzuqi Bin Ghali",
                style: TextStyle(fontSize: 13.0),
              ),
              Text(
                "Muhammad Fayyadh Bin Mohd Salehoddin",
                style: TextStyle(fontSize: 13.0),
              ),
              Text(
                "Risshe A/L Peter",
                style: TextStyle(fontSize: 13.0),
              ),
            ])));
  }
}
