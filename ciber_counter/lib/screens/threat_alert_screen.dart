import 'package:flutter/material.dart';

class ThreatAlertScreen extends StatelessWidget {
  final String threatDescription;

  const ThreatAlertScreen(this.threatDescription);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alerta de Ameaça")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ameaça Detectada: $threatDescription'),
            ElevatedButton(
              onPressed: () {
                print("Ameaça bloqueada!");
              },
              child: const Text('Bloquear Ameaça'),
            ),
          ],
        ),
      ),
    );
  }
}
