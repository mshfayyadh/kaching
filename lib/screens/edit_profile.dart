import 'package:flutter/material.dart';
import 'package:map_profile/models/profile_data.dart';
//import 'dart:async';

class EditProfile extends StatefulWidget {
  final ProfileData editData;
  EditProfile(this.editData);

  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  TextEditingController _c;

  @override
  void initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String fname = widget.editData.first;
    String lname = widget.editData.last;
    String mail = widget.editData.email;
    String ph = widget.editData.phone;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              buildtextField("First Name", fname),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              buildtextField("Last Name", lname),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              buildtextField("Email", mail),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              buildtextField("Contact Number", ph),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _c.text = fname;
                        widget.editData.first = _c.text;
                        widget.editData.last = lname;
                        widget.editData.email = mail;
                        widget.editData.phone = ph;
                      });

                      Navigator.pop(context);
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildtextField(String labelText, String placeholder) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 8.0),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
      onChanged: (val) => setState(() {
        placeholder = val;
      }),
      controller: _c,
    );
  }
}
