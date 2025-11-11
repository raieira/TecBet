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
  final List<Map<String, dynamic>> selectedOdds = []; // ✅ odds selecionadas

  void _openMatch(MatchModel match) {
    Navigator.of(context).pushNamed('/detail', arguments: match);
  }

  void _toggleAddToSlip() {
    if (selectedOdds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nenhuma odd selecionada.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Você adicionou ${selectedOdds.length} odds ao cupom!',
        ),
      ),
    );

    setState(() {
      selectedOdds.clear();
    });
  }

  void _onOddToggle(double odd, String tipo, MatchModel match) {
    final existingIndex = selectedOdds.indexWhere(
      (item) =>
          item['odd'] == odd &&
          item['tipo'] == tipo &&
          item['match'] == match, // garante que é do mesmo jogo
    );

    setState(() {
      if (existingIndex >= 0) {
        // já está selecionada → remove
        selectedOdds.removeAt(existingIndex);
      } else {
        // ainda não está → adiciona
        selectedOdds.add({'odd': odd, 'tipo': tipo, 'match': match});
      }
    });
  }

  bool _isOddSelected(double odd, String tipo, MatchModel match) {
    return selectedOdds.any(
      (item) =>
          item['odd'] == odd && item['tipo'] == tipo && item['match'] == match,
    );
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
                    onTap: () => _openMatch(highlighted),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      children: [
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
                      return MatchCard(
                        match: m,
                        onTap: () => _openMatch(m),
                        onOddToggle: (odd, tipo) => _onOddToggle(odd, tipo, m),
                        isOddSelected: (odd, tipo) =>
                            _isOddSelected(odd, tipo, m),
                      );
                    },
                    childCount: matches.length,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 120)),
              ],
            ),
          ),
          BetSlip(
            items: selectedOdds.length,
            onOpen: _toggleAddToSlip,
          ),
        ],
      ),
    );
  }
}
