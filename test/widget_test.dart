import 'package:flutter_test/flutter_test.dart';
import 'package:tecbet/main.dart';

void main() {
  testWidgets('Verifica se o app inicia com a HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const TecBetApp());
    expect(find.text('TecBet'), findsOneWidget);
  });
}