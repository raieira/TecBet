class MatchModel {
  final int id;
  final String homeTeam;
  final String awayTeam;
  final String date; // ISO string
  final String league;

  MatchModel({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.date,
    required this.league,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    final fixture = json['fixture'];
    final teams = json['teams'];
    final league = json['league'];
    return MatchModel(
      id: fixture['id'] as int,
      homeTeam: teams['home']['name'] as String,
      awayTeam: teams['away']['name'] as String,
      date: fixture['date'] as String,
      league: league['name'] as String,
    );
  }
}
