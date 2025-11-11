class BetModel {
  final String? id;
  final int matchId;
  final String selection; // ex: 'home', 'draw', 'away'
  final double stake; // valor apostado (simulado)
  final double odd; // odd no momento da aposta
  final String userId;
  final String date; // iso

  BetModel({
    this.id,
    required this.matchId,
    required this.selection,
    required this.stake,
    required this.odd,
    required this.userId,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
        'matchId': matchId,
        'selection': selection,
        'stake': stake,
        'odd': odd,
        'userId': userId,
        'date': date,
      };

  factory BetModel.fromMap(Map<String, dynamic> map, [String? id]) {
    return BetModel(
      id: id,
      matchId: map['matchId'] as int,
      selection: map['selection'] as String,
      stake: (map['stake'] as num).toDouble(),
      odd: (map['odd'] as num).toDouble(),
      userId: map['userId'] as String,
      date: map['date'] as String,
    );
  }
}
