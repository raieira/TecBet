import 'package:flutter/material.dart';
import '../../models/match_model.dart';
import '../pages/match_detail_page.dart';

class MatchTile extends StatelessWidget {
  final MatchModel match;
  const MatchTile({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${match.homeTeam} vs ${match.awayTeam}'),
      subtitle: Text('${match.league} • ${match.date.substring(0, 10)}'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => MatchDetailPage(match: match)));
      },
    );
  }
}
