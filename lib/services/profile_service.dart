import 'package:ka_ching/app/dependecies.dart';
import 'package:ka_ching/services/rest_service.dart';
import '../models/profile_data.dart';

class ProfileService {
  final rest = dependency<RestService>();

  Future<ProfileData> addUser({ProfileData i}) async {
    final json = await rest.post('profile/', data: i);

    return ProfileData.fromJson(json);
  }

  Future<List<ProfileData>> getUserList({String months}) async {
    final listJson = await rest.get('profile');

    return (listJson as List)
        .map((itemJson) => ProfileData.fromJson(itemJson))
        .toList();
  }

  Future<ProfileData> updateUser({ProfileData i, int id}) async {
    final json = await rest.patch('profile/$id', data: i);

    return ProfileData.fromJson(json);
  }
}