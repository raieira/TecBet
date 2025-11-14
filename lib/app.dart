import 'package:flutter/material.dart';

// Imports usando package:tecbet/... — garante que o Dart ache os arquivos mesmo que sejam referenciados por testes ou por outras pastas.
import 'package:tecbet/views/home_page.dart';
import 'package:tecbet/views/match_detail_page.dart';
import 'package:tecbet/models/match_model.dart';
import 'package:tecbet/views/bilhete_page.dart';
import 'package:tecbet/views/validar_page.dart';
import 'package:tecbet/views/live_page.dart';
import 'package:tecbet/views/apostas_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TecBet UI',
      debugShowCheckedModeBanner: false,
      // Tema dark consistente com suas telas
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        colorScheme: const ColorScheme.dark(
          primary: Colors.red,
          secondary: Colors.redAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D0D0D),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      // Use initialRoute + routes para facilitar testes e navegação por nome
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(), // certifique-se que a class na home é HomePage (ou ajuste para HomeScreen)
        '/bilhete': (_) => const BilhetePage(),
        '/validar': (_) => const ValidarPage(),
        '/aovivo': (_) => const LivePage(),
        '/apostas': (_) => const ApostasPage(),
      },
      onGenerateRoute: (settings) {
        // Rota dinâmica para detail (caso use MatchModel)
        if (settings.name == '/detail' && settings.arguments is MatchModel) {
          final match = settings.arguments as MatchModel;
          return MaterialPageRoute(builder: (_) => MatchDetailPage(match: match));
        }
        // rota não encontrada
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Rota não encontrada')),
          ),
        );
      },
    );
  }
}
