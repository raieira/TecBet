import 'package:flutter/material.dart';
import '../../models/match_model.dart';
import '../../models/bet_model.dart';
import '../../controllers/bet_controller.dart';

class BetPage extends StatefulWidget {
  final MatchModel match;
  final String selection;
  final double odd;
  const BetPage({super.key, required this.match, required this.selection, required this.odd});

  @override
  State<BetPage> createState() => _BetPageState();
}

class _BetPageState extends State<BetPage> {
  final _controller = BetController();
  final TextEditingController _stakeController = TextEditingController(text: '10');
  bool saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmar aposta')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Partida: ${widget.match.homeTeam} x ${widget.match.awayTeam}'),
            const SizedBox(height: 8),
            Text('Seleção: ${widget.selection}  •  Odd: ${widget.odd}'),
            const SizedBox(height: 16),
            TextField(
              controller: _stakeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Valor (simulado)'),
            ),
            const SizedBox(height: 24),
            saving
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () async {
                      final stake = double.tryParse(_stakeController.text) ?? 0.0;
                      if (stake <= 0) return;
                      setState(() => saving = true);
                      final bet = BetModel(
                        matchId: widget.match.id,
                        selection: widget.selection,
                        stake: stake,
                        odd: widget.odd,
                        userId: 'demo', // para demo; integrar auth se quiser
                        date: DateTime.now().toIso8601String(),
                      );
                      await _controller.placeBet(bet);
                      setState(() => saving = false);
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: const Text('Confirmar aposta'))
          ],
        ),
      ),
    );
  }
}
