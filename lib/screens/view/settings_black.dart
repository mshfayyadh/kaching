import 'package:flutter/material.dart';

class SettingsBlack extends StatefulWidget {
  @override
  _SettingsBlack createState() => _SettingsBlack();
}

class _SettingsBlack extends State<SettingsBlack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Settings",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        subtitle: Text(
                          "Theme",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          "Light Mode",
                          style: TextStyle(color: Colors.white),
                        ),
                        tileColor: Colors.black,
                        trailing: Switch(
                          value: true,
                          onChanged: (bool val) => Navigator.pop(context),
                          ),
                    
                      ),
                      ListTile(
                        subtitle: Text(
                          "Set Remainder",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          "Incomes and Expenses",
                          style: TextStyle(color: Colors.white),
                        ),
                        tileColor: Colors.black,
                      ),
                      ListTile(
                        subtitle: Text(
                          "Log Out",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          "Switch Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        tileColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
