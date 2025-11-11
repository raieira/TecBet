import 'package:flutter/material.dart';
import '../../models/match_model.dart';
import 'bet_page.dart';

class MatchDetailPage extends StatelessWidget {
  final MatchModel match;
  const MatchDetailPage({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final homeOdd = 1.8;
    final drawOdd = 3.2;
    final awayOdd = 4.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da partida')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${match.homeTeam} vs ${match.awayTeam}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Liga: ${match.league}'),
            const SizedBox(height: 16),
            const Text('Opções de aposta', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListTile(
              title: Text('Vitória ${match.homeTeam}'),
              trailing: Text(homeOdd.toString()),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BetPage(match: match, selection: 'home', odd: homeOdd))),
            ),
            ListTile(
              title: const Text('Empate'),
              trailing: Text(drawOdd.toString()),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BetPage(match: match, selection: 'draw', odd: drawOdd))),
            ),
            ListTile(
              title: Text('Vitória ${match.awayTeam}'),
              trailing: Text(awayOdd.toString()),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BetPage(match: match, selection: 'away', odd: awayOdd))),
            ),
          ],
        ),
      ),
    );
  }
}
