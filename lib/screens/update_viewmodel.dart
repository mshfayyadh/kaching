import 'package:flutter/cupertino.dart';
import 'package:ka_ching/models/profile_data.dart';
import 'package:ka_ching/services/update_service.dart';

class UpdateViewModel extends ChangeNotifier {
  UpdateService dataService;
  List<ProfileData> profile;

  Future<void> updateUser(
      {String first,
      String last,
      String email,
      String phone,
      String pass,
      int id}) async {
    final newUser = await dataService.updateUser(
        id: id,
        i: ProfileData(
            first: first, last: last, email: email, phone: phone, pass: pass));
    profile.add(newUser);
    notifyListeners();
  }
}
