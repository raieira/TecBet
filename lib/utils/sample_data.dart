import '../models/match_model.dart';

final List<MatchModel> sampleMatches = [
  MatchModel(
    id: 'm1',
    matches: 'Flamengo',
    away: 'Palmeiras',
    homeOdds: 2.10,
    drawOdds: 3.40,
    awayOdds: 3.10,
    date: DateTime.now().add(const Duration(hours: 2)),
    live: false,
  ),
  MatchModel(
  
    id: 'm2',
    matches: 'Corinthians',
    away: 'São Paulo',
    homeOdds: 1.95,
    drawOdds: 3.50,
    awayOdds: 4.20,
    date: DateTime.now().add(const Duration(hours: 5)),
    live: true,
  ),
  MatchModel(
    id: 'm3',
    matches: 'Vasco',
    away: 'Botafogo',
    homeOdds: 2.50,
    drawOdds: 3.10,
    awayOdds: 2.80,
    date: DateTime.now().add(const Duration(days: 1)),
    live: false,
  ),
  MatchModel(
    id: 'm4', 
    matches: 'Sete de Setembro', 
    away: 'AGA', 
    homeOdds: 1.90, 
    drawOdds: 2.00, 
    awayOdds: 1.50, 
    date: DateTime.now().add(const Duration(hours: 4)),
    live: false)
];
