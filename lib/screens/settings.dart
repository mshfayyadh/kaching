import 'package:flutter/material.dart';
import 'package:map_profile/settings_black.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        subtitle: Text("Theme"),
                        title: Text("Dark Mode"),
                        trailing: Switch(
                          value: false,
                          onChanged: (bool val) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SettingsBlack(),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        subtitle: Text("Set Remainder"),
                        title: Text("Incomes and Expenses"),
                      ),
                      ListTile(
                        subtitle: Text("Log Out"),
                        title: Text("Switch Account"),
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
