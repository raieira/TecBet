import '../models/match_model.dart';
import '../services/api_service.dart';

class MatchController {
  final ApiService _api = ApiService();

  Future<List<MatchModel>> fetchMatches() async {
    return await _api.fetchMatches();
  }
}
