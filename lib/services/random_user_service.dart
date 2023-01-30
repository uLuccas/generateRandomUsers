import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/randon_user_models.dart';

Future<RandomUser> getRandomUser() async {
  const url = 'https://randomuser.me/api/';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return RandomUser.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Falha na busca!");
  }
}
