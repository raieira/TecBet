class HomeTeamModel {
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crest;

  HomeTeamModel ({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });

  static fromJson(Map<String, dynamic>json) {
    return HomeTeamModel(
      id: json['id'],
      name:  json['name'],
      shortName: json['shortName'],
      tla: json['tla'],
      crest: json['crest'],
    );
  }
}