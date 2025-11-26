import 'package:flutter/material.dart';
import '../models/match_model.dart';

class MatchDetailPage extends StatelessWidget {
  final MatchModel match;

  const MatchDetailPage({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${match.matches} x ${match.awayTeam}'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${match.matches}  x  ${match.awayTeam}',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Data: ${_formatDate(DateTime.now())}'),// TODO: RESOLVER DEPOIS
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _betOption('${match.matches}', match.homeTeam as double),
                _betOption('Empate', 0.5), // TODO: RESOLVER DEPOIS
                _betOption('${match.awayTeam}', 5),// TODO: RESOLVER DEPOIS
              ],
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            const Text('Estatísticas',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(''),
            const SizedBox(height: 12),
            const Expanded(child: Center(child: Text(''))),
          ],
        ),
      ),
    );
  }

  static Widget _betOption(String title, double odd) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300)),
          child: Column(
            children: [
              Text(odd.toStringAsFixed(2),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              ElevatedButton(onPressed: () {}, child: const Text('Selecione'))
            ],
          ),
        )
      ],
    );
  }

  static String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }
}
