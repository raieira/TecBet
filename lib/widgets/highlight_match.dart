/*import 'package:flutter/material.dart';
import '../models/match_model.dart';

class HighlightMatch extends StatelessWidget {
  final MatchModel match;
  final VoidCallback onTap;

  const HighlightMatch({super.key, required this.match, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0EA5A0), Color(0xFF134E4A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${match.matches}  x  ${match.away}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Início: ${_formatDate(match.date)}',
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(match.live ? 'AO VIVO' : 'AO VIVO', // leave for style
                    style: TextStyle(
                        color: match.live ? Colors.redAccent : Colors.white70,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _oddsChip('${match.homeOdds.toStringAsFixed(2)}'),
                    const SizedBox(width: 6),
                    _oddsChip('${match.drawOdds.toStringAsFixed(2)}'),
                    const SizedBox(width: 6),
                    _oddsChip('${match.awayOdds.toStringAsFixed(2)}'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget _oddsChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(8)),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  static String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}*/
