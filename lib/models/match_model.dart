import 'package:tecbet/models/awayTeamModel.dart';
import 'package:tecbet/models/competition.dart';
import 'package:tecbet/models/homeTeamModel.dart';

class MatchModel {
  final String id;
  final String matches;
  final competitionModel competition;
  final homeTeamModel homeTeam;
  final awayTeamModel awayTeam;

  MatchModel({
    required this.id,
    required this.matches,
    required this.awayTeam,
    required this.competition,
    required this.homeTeam,
  });

  static MatchModel fromJson(Map<String, dynamic> json) {
    return MatchModel(
      awayTeam: awayTeamModel.fromJson(json['awayTeam']),
      competition: json['competition'],
      homeTeam: json['homeTeam'],
      id: json['id'],
      matches: json['matches'],
    );
  }
}
