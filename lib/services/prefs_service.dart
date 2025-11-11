import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bet_model.dart';

class PrefsService {
  static const _betsKey = 'bets_cache';

  Future<void> saveBetLocally(BetModel bet) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_betsKey) ?? [];
    current.insert(0, jsonEncode(bet.toMap()));
    await prefs.setStringList(_betsKey, current);
  }

  Future<List<BetModel>> getLocalBets() async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_betsKey) ?? [];
    return current.map((s) {
      final map = jsonDecode(s) as Map<String, dynamic>;
      return BetModel.fromMap(map);
    }).toList();
  }
}
