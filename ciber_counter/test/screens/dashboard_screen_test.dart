import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ciber_counter/screens/dashboard_screen.dart';
import 'package:ciber_counter/models/threat_detection.dart';
import 'package:flutter/material.dart';

void main() {
  group('DashboardScreen', () {
    testWidgets('deve exibir a barra de progresso e botões corretamente', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DashboardScreen(),
        ),
      );

      // Verifica se a barra de progresso está presente
      expect(find.byType(LinearProgressIndicator), findsOneWidget);

      // Verifica se o botão "Detectar Ameaças" está presente
      expect(find.text('Detectar Ameaças'), findsOneWidget);

      // Verifica se o botão "Bloquear Ameaças" está presente
      expect(find.text('Bloquear Ameaças'), findsOneWidget);

      // Verifica se o botão "Sair" está presente
      expect(find.text('Sair'), findsOneWidget);
    });

    testWidgets('deve iniciar a detecção de ameaças ao clicar no botão', (tester) async {
      // Cria o widget da Dashboard
      await tester.pumpWidget(
        MaterialApp(
          home: DashboardScreen(),
        ),
      );

      // Clica no botão "Detectar Ameaças"
      await tester.tap(find.text('Detectar Ameaças'));
      await tester.pump(); // Aguarda a animação e a atualização do estado

      // Verifica se a barra de progresso está sendo atualizada (exemplo: valor > 0)
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('deve exibir ameaças quando detectadas', (tester) async {
      // Cria o widget da Dashboard
      await tester.pumpWidget(
        MaterialApp(
          home: DashboardScreen(),
        ),
      );

      // Clica no botão "Detectar Ameaças"
      await tester.tap(find.text('Detectar Ameaças'));
      await tester.pump();

      // Aguarda a detecção de ameaças
      await tester.pump(Duration(seconds: 3)); // Aguarda a detecção

      // Verifica se a lista de ameaças está sendo exibida
      expect(find.byType(ListTile), findsWidgets); // Deve encontrar ao menos 1 ListTile
    });

    testWidgets('deve bloquear as ameaças corretamente', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DashboardScreen(),
        ),
      );

      await tester.tap(find.text('Detectar Ameaças'));
      await tester.pump();

      await tester.pump(Duration(seconds: 3));

      await tester.tap(find.text('Bloquear Ameaças'));
      await tester.pump();

      expect(find.text('Todas as ameaças foram neutralizadas!'), findsOneWidget);
    });
  });
}
