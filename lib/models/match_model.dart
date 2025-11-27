import 'package:tecbet/models/awayTeamModel.dart';
import 'package:tecbet/models/homeTeamModel.dart';

class MatchModel {
  final int id;
  final String matches; // vamos usar para o horário
  final HomeTeamModel homeTeam;
  final AwayTeamModel awayTeam;
  final String competition;

  MatchModel({
    required this.id,
    required this.matches,
    required this.homeTeam,
    required this.awayTeam,
    required this.competition,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json["id"] ?? 0,
      matches: json["utcDate"] ?? "",
      homeTeam: HomeTeamModel.fromJson(json["homeTeam"]),
      awayTeam: AwayTeamModel.fromJson( json["awayTeam"]),
      competition: json["competition"]["name"] ?? "",
    );
  }
}
