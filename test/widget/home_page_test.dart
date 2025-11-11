import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tecbet/views/pages/home_page.dart';

void main() {
  testWidgets('HomePage mostra CircularProgress inicialmente', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
