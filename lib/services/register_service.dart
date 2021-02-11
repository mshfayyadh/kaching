import 'package:ka_ching/services/rest_service.dart';
import '../models/profile_data.dart';

class RegisterService {
  final rest = RestService();

  Future<ProfileData> addUser({ProfileData i}) async {
    final json = await rest.post('profile', data: i);

    return ProfileData.fromJson(json);
  }
}
