import 'package:tecbet/controllers/match_repository.dart';
import 'package:tecbet/models/match_model.dart';

class MatchesController {
  final MatchRepository repository;

  const MatchesController({required this.repository});

  Future<List<MatchModel>> getAllMatch() async {
    return await repository.getAllMatch();
  }

}