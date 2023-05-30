import 'dart:math';

import 'package:dio/dio.dart';
import 'package:rest_app_client/model/user.dart';

final dio = Dio();

Future<User?> authenticate(String login, String password) async {
  Map<String, String> credentials = {'login': login, 'password': password};
  Response response = await dio.post(
      'http://192.168.1.7:5000/api/user/authenticate',
      data: {'credentials': credentials});
  if (response.statusCode == 200) {
    String name = response.data['name'];
    String email = response.data['email'];
    return Future.value(User(name: name, email: email));
  } else {
    return Future.value(null);
  }
}
