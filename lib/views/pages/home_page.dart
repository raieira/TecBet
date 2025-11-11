import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  List<dynamic> matches = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadMatches();
  }

  Future<void> loadMatches() async {
    try {
      final data = await apiService.getLiveMatches();
      setState(() {
        matches = data;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      debugPrint('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EEF8),
      appBar: AppBar(
        title: const Text('TecBet ⚽'),
        centerTitle: true,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : matches.isEmpty
              ? const Center(child: Text('Nenhum jogo ao vivo no momento.'))
              : ListView.builder(
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    final match = matches[index]['fixture'];
                    final teams = matches[index]['teams'];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                            '${teams['home']['name']} vs ${teams['away']['name']}'),
                        subtitle: Text(match['status']['long']),
                        trailing: const Icon(Icons.sports_soccer),
                      ),
                    );
                  },
                ),
    );
  }
}
