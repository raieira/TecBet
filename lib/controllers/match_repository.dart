import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tecbet/models/match_model.dart';

class MatchRepository {
  final String baseUrl;

  const MatchRepository({required this.baseUrl});

  Future<List<MatchModel>> getAllMatch() async {
    final response = await http.get(Uri.parse('$baseUrl/matches'));

    final map = jsonDecode(response.body);

    final matches = map['results'];

    final result = (matches as List).map((c) => MatchModel.fromJson(c)).toList();

    return result; 
  }
}