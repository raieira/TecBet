import 'package:flutter/material.dart';
import '../models/match_model.dart';
import '../utils/sample_data.dart';
import '../widgets/match_card.dart';
import '../widgets/highlight_match.dart';
import '../widgets/bet_slip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MatchModel> matches = sampleMatches;
  int betItems = 0;

  void _openMatch(MatchModel match) {
    Navigator.of(context).pushNamed('/detail', arguments: match);
  }

  void _toggleAddToSlip() {
    setState(() {
      betItems = (betItems + 1) % 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    final highlighted = matches.first;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TecBet'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              
              await Future.delayed(const Duration(milliseconds: 700));
              setState(() {});
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: HighlightMatch(
                        match: highlighted,
                        onTap: () => _openMatch(highlighted))),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      children: const [
                        Text('Próximos Jogos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Spacer(),
                        Text('Ver todos',
                            style: TextStyle(color: Colors.blueAccent)),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, i) {
                      final m = matches[i];
                      return GestureDetector(
                        onTap: () => _openMatch(m),
                        child: MatchCard(match: m, onTap: () => _openMatch(m)),
                      );
                    },
                    childCount: matches.length,
                  ),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 120)),
              ],
            ),
          ),
          BetSlip(items: betItems, onOpen: _toggleAddToSlip),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(117),
        child: FloatingActionButton.extended(
          onPressed: _toggleAddToSlip,
          label: const Text('Adicionar ao cupom'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
