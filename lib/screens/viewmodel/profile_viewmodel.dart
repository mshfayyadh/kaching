import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/models/profile_data.dart';
import 'package:ka_ching/services/profile_service.dart';

import '../viewmodel.dart';

class ProfileViewModel extends Viewmodel {
  ProfileService get dataService => dependency();
  List<ProfileData> profile;
  ProfileData user;

  Future<void> addUser({String first,String last,String email,String phone, String pass}) async {
    turnBusy();
    
    final newUser = await dataService.addUser(i: ProfileData(first: first, last: last, email: email, phone: phone, pass: pass));
  
    turnIdle();
  }

  Future<void> updateUser({String first,String last,String email,String phone,String pass,int id}) async {
    turnBusy();
    final updateUser = await dataService.updateUser(id: id,i: ProfileData(first: first, last: last, email: email, phone: phone));
      
    turnIdle();
  }

  void getUser() async {
    turnBusy();

    profile = await dataService.getUserList();
    user = profile.elementAt(0);
     
    turnIdle();
  }
}