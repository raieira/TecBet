import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://v3.football.api-sports.io';
  final String _apiKey = 'COLOQUE_SUA_API_KEY_AQUI'; // coloque sua API KEY da API-FOOTBALL

  Future<List<dynamic>> getLiveMatches() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/fixtures?live=all'),
      headers: {'x-apisports-key': _apiKey},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['response'] ?? [];
    } else {
      throw Exception('Erro ao buscar dados da API (${response.statusCode})');
    }
  }
}
