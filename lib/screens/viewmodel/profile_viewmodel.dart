import 'package:ka_ching/app/dependecies.dart';
import 'package:flutter/material.dart';
import 'package:ka_ching/models/profile_data.dart';
import 'package:ka_ching/services/profile_service.dart';

import '../viewmodel.dart';

class ProfileViewModel extends Viewmodel {
  ProfileService get dataService => dependency();
  List<ProfileData> users;
  ProfileData user;

  Future<void> addUser({String first,String last,String email,String phone, String pass}) async {
    turnBusy();
    
    final newUser = await dataService.addUser(i: ProfileData(first: first, last: last, email: email, phone: phone, pass: pass));
  
    turnIdle();
  }

  Future<void> updateUser({String first,String last,String email,String phone,String pass,String id}) async {
    turnBusy();
    final updateUser = await dataService.updateUser(id: id,i: ProfileData(first: first, last: last, email: email, phone: phone));
      
    turnIdle();
  }

  void getUser() async {
    turnBusy();

    users = await dataService.getUserList();
    user = users.elementAt(0);
     
    turnIdle();
  }

  void getUsers() async{
    turnBusy();

    users = await dataService.getUserList();

    turnIdle();
  }

  bool checkUser({String username,String password}) {
    bool found = false;

    for(int i=0;i<users.length;i++)
    {
      if(users[i].first.toString().compareTo(username) == 0 && users[i].pass.toString().compareTo(password) == 0)
      {
        user = users[i];
        found = true;
      }
    }
    return found;
  }
}