import 'package:flutter/material.dart';
import '../models/match_model.dart';

class MatchCard extends StatelessWidget {
  final MatchModel match;
  final VoidCallback onTap;
  final Function(double, String)
      onOddToggle; 
  final bool Function(double, String)
      isOddSelected;

  const MatchCard({
    super.key,
    required this.match,
    required this.onTap,
    required this.onOddToggle,
    required this.isOddSelected,
  });

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
            Expanded(
              child: Text(
                '${match.home}  x  ${match.away}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            if (match.live)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'AO VIVO',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(_formatDate(match.date)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _oddsBox('Casa', match.homeOdds, onOddToggle, isOddSelected),
                _oddsBox('Empate', match.drawOdds, onOddToggle, isOddSelected),
                _oddsBox('Fora', match.awayOdds, onOddToggle, isOddSelected),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _oddsBox(
    String label,
    double odd,
    Function(double, String) onOddToggle,
    bool Function(double, String) isOddSelected,
  ) {
    final selected = isOddSelected(odd, label);

    return GestureDetector(
      onTap: () => onOddToggle(odd, label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected
              ? Colors.orange.shade400
              : Colors.white, 
          border: Border.all(
            color: selected ? Colors.orange : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(6),
          boxShadow: selected
              ? [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: selected ? Colors.white : Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              odd.toStringAsFixed(2),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}
