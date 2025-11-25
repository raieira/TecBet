import 'package:flutter/material.dart';
import 'package:tecbet/views/bilhete_page.dart';
import 'package:tecbet/views/live_page.dart';
import 'package:tecbet/views/validar_page.dart';
import 'package:tecbet/views/apostas_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tecbet/views/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeContent(),
    const LivePage(),
    const BilhetePage(),
    const ValidarPage(),
    const ApostasPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: "Ao vivo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Bilhete",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: "Validar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: "Apostas",
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('lib/assets/logo.png', height: 100),
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
                    'R\$ 1.480,43',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove("logado");

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset("lib/assets/banner$i.png"),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              sectionTitle("Futebol"),
              _buildMatchCard(
                country: "BRASIL: SÉRIE A",
                teamA: "FLAMENGO",
                teamB: "PALMEIRAS",
                time: "Em breve",
                oddHome: "2.10",
                oddDraw: "3.20",
                oddAway: "3.30",
                teamAImg: "lib/assets/flamengo.jpg",
                teamBImg: "lib/assets/palmeiras.png",
              ),
              const SizedBox(height: 20),
              sectionTitle("Basquete"),
              _buildMatchCard(
                country: "NBA",
                teamA: "LAKERS",
                teamB: "BOSTON CELTICS",
                time: "Hoje • 22:00",
                oddHome: "1.80",
                oddDraw: null,
                oddAway: "2.10",
                teamAImg: "lib/assets/lakers.jpg",
                teamBImg: "lib/assets/celtics.png",
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
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

  Widget _buildMatchCard({
    required String country,
    required String teamA,
    required String teamB,
    required String time,
    required String? oddHome,
    required String? oddDraw,
    required String? oddAway,
    required String teamAImg,
    required String teamBImg,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Image.asset(teamAImg, height: 32, width: 32),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(teamA,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Image.asset(teamBImg, height: 32, width: 32),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(teamB,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 12),
            child: Text(time, style: const TextStyle(color: Colors.white54)),
          ),
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

  Widget _odds(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.yellow,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
