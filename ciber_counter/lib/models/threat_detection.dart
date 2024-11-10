import 'dart:async';

class ThreatDetection {
  List<String> detectedThreats = [];

  Future<void> loadModel() async {
    print("Modelo de IA carregado.");
  }

  Future<void> detectThreats({required Null Function() onThreatDetected}) async {
    Timer.periodic(Duration(seconds: 2), (timer) {
      String fakeThreat = "Ameaça ${detectedThreats.length + 1}";
      detectedThreats.add(fakeThreat);

      print("Detectado: $fakeThreat");

      if (detectedThreats.length >= 5) {
        timer.cancel();
      }
    });
  }

  void clearThreats() {
    detectedThreats.clear();
    print("Todas as ameaças foram bloqueadas e removidas.");
  }
}