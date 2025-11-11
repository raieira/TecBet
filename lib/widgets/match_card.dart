import 'package:flutter/material.dart';
import '../models/match_model.dart';

class MatchCard extends StatelessWidget {
  final MatchModel match;
  final VoidCallback onTap;

  const MatchCard({super.key, required this.match, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        title: Row(
          children: [
            Expanded(child: Text('${match.home}  x  ${match.away}', style: const TextStyle(fontWeight: FontWeight.w600))),
            if (match.live)
            
              Container(
                
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(6)),
                child: const Text('AO VIVO', style: TextStyle(color: Colors.white, fontSize: 12)),
              )
          ],
        ),
        subtitle: Row(
          children: [
            Text(_formatDate(match.date)),
            const Spacer(),
            _oddsBox(match.homeOdds),
            const SizedBox(width: 6),
            _oddsBox(match.drawOdds),
            const SizedBox(width: 6),
            _oddsBox(match.awayOdds),
          ],
        ),
      ),
    );
  }

  static Widget _oddsBox(double odd) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255),   border: Border.all(color: const Color.fromARGB(255, 143, 38, 38)), borderRadius: BorderRadius.circular(6)),
      child:
       Text(odd.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold)),
      
    );
  }

  static String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2,'0')}/${dt.month.toString().padLeft(2,'0')} ${dt.hour.toString().padLeft(2,'0')}:${dt.minute.toString().padLeft(2,'0')}';
  }
}
