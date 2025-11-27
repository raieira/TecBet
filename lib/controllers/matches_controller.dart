import 'package:tecbet/controllers/match_repository.dart';
import 'package:tecbet/models/match_model.dart';

class MatchesController {
  final MatchRepository repository;

  MatchesController({required this.repository});

  List<MatchModel> matches = [];

  Future<void> loadMatches() async {
    matches = await repository.getAllMatch();
  }
}
