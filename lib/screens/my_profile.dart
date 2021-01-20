import 'package:flutter/material.dart';
import '../screens/edit_profile.dart';
import '../models/profile_data.dart';

// ignore: must_be_immutable
class MyProfile extends StatefulWidget {
  ProfileData data;

  MyProfile(this.data);

  @override
  _MyProfile createState() => _MyProfile();
}

class _MyProfile extends State<MyProfile> {
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
          onPressed: () {},
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
                "Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.yellow.withOpacity(0.8),
                              offset: Offset(0, 10),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://cdn1.iconfinder.com/data/icons/circle-outlines-colored/512/User_Account_Person_Avatar_Profile_Man_Head-512.png"),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Card(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        subtitle: Text("First Name"),
                        title: new Text(widget.data.first),
                      ),
                      ListTile(
                        subtitle: Text("Last Name"),
                        title: Text(widget.data.last),
                      ),
                      ListTile(
                        subtitle: Text("Email"),
                        title: new Text(widget.data.email),
                      ),
                      ListTile(
                        subtitle: Text("Contact Number"),
                        title: new Text(widget.data.phone),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      final returnData = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile(widget.data)),
                      );

                      if (returnData != null) {
                        setState(() => widget.data = returnData);
                      }
                    },
                    color: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
