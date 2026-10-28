import 'package:flutter_test/flutter_test.dart';

import 'package:campus_em_foco/main.dart';

void main() {
  testWidgets('navega para a tela do curso e volta', (tester) async {
    await tester.pumpWidget(const CampusEmFocoApp());

    expect(find.text('Ensino'), findsOneWidget);

    await tester.tap(find.text('Sistemas para Internet'));
    await tester.pumpAndSettle();
    expect(find.text('Duração do curso'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Voltar'), 300);
    await tester.tap(find.text('Voltar'));
    await tester.pumpAndSettle();
    expect(find.text('Central de Serviços'), findsOneWidget);
  });
}
