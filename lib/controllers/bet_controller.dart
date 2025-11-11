import '../models/bet_model.dart';
import '../services/prefs_service.dart';

class BetController {
  final PrefsService _prefs = PrefsService();

  Future<void> placeBet(BetModel bet) async {
    // salva localmente (SharedPreferences) para este projeto
    await _prefs.saveBetLocally(bet);
  }

  Future<List<BetModel>> getUserBets() async {
    return await _prefs.getLocalBets();
  }
}
