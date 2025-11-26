import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tecbet/models/match_model.dart';

class MatchRepository {
  final String baseUrl;
  final String token;

  const MatchRepository({required this.baseUrl, required this.token});

  Future<List<MatchModel>> getAllMatch() async {
    final response = await http
        .get(Uri.parse('$baseUrl/matches'), headers: {'X-Auth-Token': token});

    final map = jsonDecode(response.body);

    final matches = map['matches'];

    final result =
        (matches as List).map((c) => MatchModel.fromJson(c)).toList();

    return result;
  }
}
