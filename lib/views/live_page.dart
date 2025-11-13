import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          "AO VIVO",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// -----------------------
            ///      FUTEBOL
            /// -----------------------
            _buildCategory("Futebol"),

            _buildMatchCard(
              country: "COLÔMBIA: TORNEIO ÁGUILA",
              teamA: "CUCUTA DEPORTIVO",
              teamB: "JAGUARES DE CORDOBA",
              minute: "67'",
              scoreA: "1",
              scoreB: "1",
              oddHome: "4.70",
              oddDraw: "1.71",
              oddAway: "3.22",
            ),

            const SizedBox(height: 20),

            /// -----------------------
            ///      BASQUETE
            /// -----------------------
            _buildCategory("Basquete"),

            _buildMatchCard(
              country: "NBB",
              teamA: "PINHEIROS",
              teamB: "UNIAO CORINTHIANS",
              minute: "2° Parte",
              scoreA: "38",
              scoreB: "33",
              oddHome: "1.16",
              oddDraw: null,
              oddAway: "3.70",
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  /// ---------------------------------------
  /// WIDGET: CATEGORIA (Futebol, Basquete…)
  /// ---------------------------------------
  Widget _buildCategory(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.red,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// ---------------------------------------
  /// WIDGET: CARD DO JOGO AO VIVO
  /// ---------------------------------------
  Widget _buildMatchCard({
    required String country,
    required String teamA,
    required String teamB,
    required String minute,
    required String scoreA,
    required String scoreB,
    required String? oddHome,
    required String? oddDraw,
    required String? oddAway,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          /// Cabeçalho
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: Text(
              country,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// Times
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(teamA, style: const TextStyle(color: Colors.white)),
                    Text(scoreA, style: const TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(teamB, style: const TextStyle(color: Colors.white)),
                    Text(scoreB, style: const TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  minute,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          ),

          /// ODDS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (oddHome != null) _odds("Casa", oddHome),
              if (oddDraw != null) _odds("Empate", oddDraw),
              if (oddAway != null) _odds("Fora", oddAway),
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }

  /// ---------------------------------------
  /// WIDGET ODDS
  /// ---------------------------------------
  Widget _odds(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Colors.yellow, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
