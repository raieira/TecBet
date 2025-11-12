import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'views/match_detail_page.dart';
import 'models/match_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TecBet UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF111827),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail' && settings.arguments is MatchModel) {
          final match = settings.arguments as MatchModel;
          return MaterialPageRoute(
            builder: (_) => MatchDetailPage(match: match),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Rota não encontrada')),
          ),
        );
      },
    );
  }
}
