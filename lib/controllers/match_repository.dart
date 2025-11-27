import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tecbet/models/match_model.dart';

class MatchRepository {
  final String baseUrl;
  final String token;

  const MatchRepository({required this.baseUrl, required this.token});

  Future<List<MatchModel>> getAllMatch() async {
    final response = await http.get(
      Uri.parse('$baseUrl/competitions/BSA/matches'),
      headers: {'X-Auth-Token': token},
    );

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar partidas: ${response.statusCode}");
    }

    final map = jsonDecode(response.body);
    final matches = map['matches'];

    return (matches as List)
        .map((data) => MatchModel.fromJson(data))
        .toList();
  }
}
