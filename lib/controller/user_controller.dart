import '../model/user.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController {
  Future<List<User>>fetchUserData() async {
    final response = await http.get(Uri.parse('https://randomapi.com/api/6de6abfedb24f889e0b5f675edc50deb?fmt=raw&sole'));

    if (response.statusCode == 200) {
      // Pegando uma lista de usuários
      List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      throw Exception('Falhou ao carregar os dados');
    }
  }
}
