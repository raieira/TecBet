class competitionModel {
  final int id;
  final String name;
  final String code;
  final String flag;

  competitionModel({
    required this.id,
    required this.code,
    required this.flag,
    required this.name,
  });


  static fromJson(Map<String, dynamic>json) {
    return competitionModel(
      id: json['id'],
      code: json['code'],
      flag: json['flag'],
      name:  json['name'],
    );
  }
}

