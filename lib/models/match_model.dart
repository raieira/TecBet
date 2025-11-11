class MatchModel {
  final String id;
  final String home;
  final String away;
  final double homeOdds;
  final double drawOdds;
  final double awayOdds;
  final DateTime date;
  final bool live;

  MatchModel({
    required this.id,
    required this.home,
    required this.away,
    required this.homeOdds,
    required this.drawOdds,
    required this.awayOdds,
    required this.date,
    this.live = false,
  });
}
