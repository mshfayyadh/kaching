import 'package:ka_ching/services/rest_service.dart';
import '../models/profile_data.dart';

class UpdateService {
  final rest = RestService();

  Future<ProfileData> updateUser({ProfileData i, int id}) async {
    final json = await rest.patch('profile/$id', data: i);

    return ProfileData.fromJson(json);
  }
}
