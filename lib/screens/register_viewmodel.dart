import 'package:flutter/cupertino.dart';
import 'package:ka_ching/models/profile_data.dart';

import '../services/register_service.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterService dataService;
  List<ProfileData> profile;

  Future<void> addUser(
      {String first,
      String last,
      String email,
      String phone,
      String pass}) async {
    final newUser = await dataService.addUser(
        i: ProfileData(
            first: first, last: last, email: email, phone: phone, pass: pass));
    profile.add(newUser);
    notifyListeners();
  }
}
