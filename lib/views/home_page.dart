import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// IMPORTANTE: tela de bilhete
import 'bilhete_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> banners = [
    'lib/assets/banner1.png',
    'lib/assets/banner2.png',
    'lib/assets/banner3.png',
  ];

  final List<Map<String, dynamic>> sports = [
    {'icon': Icons.sports_soccer, 'name': 'Futebol'},
    {'icon': Icons.sports_basketball, 'name': 'Basquete'},
    {'icon': Icons.sports_mma, 'name': 'Combate'},
    {'icon': Icons.sports_tennis, 'name': 'Tênis'},
    {'icon': Icons.sports_volleyball, 'name': 'Vôlei'},
  ];

  final List<Map<String, dynamic>> matches = [
    {
      'league': 'COLÔMBIA: TORNEIO ÁGUILA',
      'home': 'INTERNACIONAL FC DE PALMIRA',
      'away': 'CD ATLÉTICO HUILA',
      'odds': {'home': 1.78, 'draw': 3.27, 'away': 4.70},
    },
    {
      'league': 'BRASIL: SÉRIE A',
      'home': 'FLAMENGO',
      'away': 'PALMEIRAS',
      'odds': {'home': 1.90, 'draw': 3.10, 'away': 4.20},
    },
  ];

  // 🔥 Navegação usando bottom navigation
  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 👉 Botão BILHETE (ícone de recibo / posição 2)
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BilhetePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('lib/assets/logo.png', height: 80),
            Row(
              children: [
                const Icon(Icons.flag, color: Colors.greenAccent, size: 20),
                const SizedBox(width: 6),
                const Icon(Icons.card_giftcard, color: Colors.red, size: 22),
                const SizedBox(width: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'R\$ 108,43',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banners
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CarouselSlider(
                items: banners
                    .map((b) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(b,
                              fit: BoxFit.cover, width: double.infinity),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
              ),
            ),

            // Esportes
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sports.length,
                itemBuilder: (context, index) {
                  final sport = sports[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(sport['icon'], color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          sport['name'],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Lista de jogos
            Column(
              children: matches.map((match) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(match['league'],
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(match['home'],
                                style:
                                    const TextStyle(color: Colors.white)),
                          ),
                          _buildOddBox(match['odds']['home']),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Empate',
                              style: TextStyle(color: Colors.white)),
                          _buildOddBox(match['odds']['draw']),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(match['away'],
                                style:
                                    const TextStyle(color: Colors.white)),
                          ),
                          _buildOddBox(match['odds']['away']),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),

      // Barra inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'Ao vivo'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Bilhete'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Validar'),
          BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Apostas'),
        ],
      ),
    );
  }

  // Caixa de odd
  Widget _buildOddBox(double odd) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        odd.toStringAsFixed(2),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
