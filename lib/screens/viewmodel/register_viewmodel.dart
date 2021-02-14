import 'package:flutter/cupertino.dart';
import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/models/profile_data.dart';
import 'package:ka_ching/screens/viewmodel.dart';

import '../../services/register_service.dart';

class RegisterViewModel extends Viewmodel {
  RegisterService get dataService => dependency();
  List<ProfileData> profile;

  Future<void> addUser(
      {String first,
      String last,
      String email,
      String phone,
      String pass}) async {
    turnBusy();
    final newUser = await dataService.addUser(
        i: ProfileData(
            first: first, last: last, email: email, phone: phone, pass: pass));
    //profile.add(newUser);
    //notifyListeners();
    turnIdle();
  }
}
