import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tecbet/controllers/matches_controller.dart';
import 'package:tecbet/controllers/match_repository.dart';
import 'package:tecbet/views/home_page.dart';
import 'package:tecbet/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool logado = prefs.getBool("logado") ?? false;

  runApp(MyApp(
      logado: logado,
      matchesController: const MatchesController(
          repository: MatchRepository(
        baseUrl: 'https://api.football-data.org/v4',
        token: '8bf39c1b2fc040c09ba3ba3c4ecc89b6',
      ))));
}

class MyApp extends StatelessWidget {
  final bool logado;
  final MatchesController matchesController;
  const MyApp(
      {super.key, required this.logado, required this.matchesController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: logado
          ? HomePage(
              matchesController: matchesController,
            )
          : LoginPage(
              matchesController: matchesController,
            ),
    );
  }
}
