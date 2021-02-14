import 'package:flutter/cupertino.dart';
import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/models/profile_data.dart';
import 'package:ka_ching/screens/viewmodel.dart';
import 'package:ka_ching/services/update_service.dart';

class UpdateViewModel extends Viewmodel {
  UpdateService get dataService => dependency();
  List<ProfileData> profile;
  ProfileData user;

  Future<void> updateUser({String first,String last,String email,String phone,String pass,int id}) async {
    turnBusy();
    final newUser = await dataService.updateUser(id: id,i: ProfileData(first: first, last: last, email: email, phone: phone));
      
    //profile.add(newUser);
    turnIdle();
    // notifyListeners();
  }

  void getUser() async {
    turnBusy();
    profile = await dataService.getUserList();
    
    user = profile.elementAt(0); 
    //notifyListeners();
    turnIdle();
  }

  void onChange() {
    notifyListeners();
  }
}
