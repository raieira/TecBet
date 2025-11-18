import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tecbet/views/home_page.dart';
import 'package:tecbet/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool logado = prefs.getBool("logado") ?? false;

  runApp(MyApp(logado: logado));
}

class MyApp extends StatelessWidget {
  final bool logado;
  const MyApp({super.key, required this.logado});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: logado ? const HomePage() : const LoginPage(),
    );
  }
}
