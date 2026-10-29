import 'package:flutter_test/flutter_test.dart';

import 'package:pry_conjunta_u1/main.dart';

void main() {
  testWidgets('Muestra la pantalla de inicio de sesión', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Costo de envío'), findsOneWidget);
    expect(find.text('Ingresar'), findsOneWidget);
  });
}
