class MatchModel {
  final int id;
  final String matches; // vamos usar para o horário
  final String homeTeam;
  final String awayTeam;
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
      homeTeam: json["homeTeam"]["name"] ?? "",
      awayTeam: json["awayTeam"]["name"] ?? "",
      competition: json["competition"]["name"] ?? "",
    );
  }
}
