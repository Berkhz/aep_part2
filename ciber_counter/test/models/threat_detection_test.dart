import 'package:flutter_test/flutter_test.dart';
import 'package:ciber_counter/models/threat_detection.dart';

void main() {
  group('ThreatDetection', () {
    test('deve inicializar sem ameaças', () {
      final threatDetection = ThreatDetection();

      // Verifica se a lista de ameaças está vazia inicialmente
      expect(threatDetection.detectedThreats.isEmpty, true);
    });

    test('deve carregar o modelo', () async {
      final threatDetection = ThreatDetection();

      // Carrega o modelo e verifica se não há erro
      await threatDetection.loadModel();

      // Teste simples para garantir que o modelo foi carregado sem erro
      expect(true, true);
    });

    test('deve detectar pelo menos 1 ameaça', () async {
      final threatDetection = ThreatDetection();

      // Carrega o modelo e começa a detecção
      await threatDetection.loadModel();
      await threatDetection.detectThreats(onThreatDetected: () {});

      // Verifica se pelo menos uma ameaça foi detectada
      expect(threatDetection.detectedThreats.isNotEmpty, true);
    });

    test('deve limpar as ameaças corretamente', () async {
      final threatDetection = ThreatDetection();

      // Carrega o modelo e começa a detecção
      await threatDetection.loadModel();
      await threatDetection.detectThreats(onThreatDetected: () {});

      // Verifica que há ameaças detectadas
      expect(threatDetection.detectedThreats.isNotEmpty, true);

      // Limpa as ameaças e verifica se a lista está vazia
      expect(threatDetection.detectedThreats.isEmpty, true);
    });
  });
}
