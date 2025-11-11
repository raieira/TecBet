import 'package:flutter/material.dart';
import '../../controllers/bet_controller.dart';
import '../../models/bet_model.dart';

class BetsHistoryPage extends StatefulWidget {
  const BetsHistoryPage({super.key});

  @override
  State<BetsHistoryPage> createState() => _BetsHistoryPageState();
}

class _BetsHistoryPageState extends State<BetsHistoryPage> {
  final _controller = BetController();
  List<BetModel> bets = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final res = await _controller.getUserBets();
    setState(() {
      bets = res;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas apostas')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : bets.isEmpty
              ? const Center(child: Text('Nenhuma aposta ainda'))
              : ListView.builder(
                  itemCount: bets.length,
                  itemBuilder: (context, index) {
                    final b = bets[index];
                    return ListTile(
                      title: Text('Match ID: ${b.matchId} - ${b.selection}'),
                      subtitle: Text('Valor: ${b.stake} • Odd: ${b.odd} • ${b.date.substring(0, 10)}'),
                    );
                  },
                ),
    );
  }
}
