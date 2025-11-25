import 'package:tecbet/models/awayTeamModel.dart';
import 'package:tecbet/models/competition.dart';
import 'package:tecbet/models/homeTeamModel.dart';

import '../models/match_model.dart';

final List<MatchModel> sampleMatches = [
  MatchModel(
    id: 'm1',
    matches: 'Flamengo',
    awayTeam: awayTeamModel(id: id, name: name, shortName: shortName, tla: tla, crest: crest),
    competition: competitionModel(id: id, code: code, flag: flag, name: name),
    homeTeam: homeTeamModel(id: id, name: name, shortName: shortName, tla: tla, crest: crest),
  ),
 
];
