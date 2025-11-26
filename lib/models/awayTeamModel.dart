class awayTeamModel {
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crest;

  awayTeamModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });

  static fromJson(Map<String, dynamic> json) {
    return awayTeamModel(
      id: json['id'],
    );
  }
}
