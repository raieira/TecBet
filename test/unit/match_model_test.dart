import 'package:flutter_test/flutter_test.dart';
import 'package:tecbet/models/match_model.dart';

void main() {
  test('MatchModel fromJson deve mapear corretamente', () {
    final json = {
      'fixture': {'id': 1, 'date': '2025-11-11T20:00:00Z'},
      'teams': {'home': {'name': 'Time A'}, 'away': {'name': 'Time B'}},
      'league': {'name': 'Campeonato'}
    };

    final m = MatchModel.fromJson(json);

    expect(m.homeTeam, 'Time A');
    expect(m.awayTeam, 'Time B');
    expect(m.league, 'Campeonato');
  });
}
