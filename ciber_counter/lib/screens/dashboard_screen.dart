import 'package:flutter/material.dart';
import 'package:ciber_counter/models/threat_detection.dart';
import 'dart:async';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ThreatDetection _threatDetection = ThreatDetection();
  double progress = 0.0;
  List<String> detectedThreats = [];
  String message = "";

  @override
  void initState() {
    super.initState();
    _threatDetection.loadModel();
  }

  void _startThreatDetection() {
    final threatNames = [
      "Ransomware - CryptoLocker",
      "Phishing - E-mail Falso",
      "Botnet - Mirai",
      "Malware - Zeus",
      "Spyware - Pegasus",
      "Trojan - Emotet",
      "DDoS - Amplification",
      "SQL Injection - Union-based",
      "Cross-Site Scripting (XSS) - Stored",
      "Man-in-the-Middle (MitM) - SSL Stripping"
    ];

    Future.delayed(Duration(seconds: 2), () {
      if (detectedThreats.length < threatNames.length) {
        setState(() {
          detectedThreats.add(threatNames[detectedThreats.length]);
          progress = detectedThreats.length / threatNames.length;
        });
        _startThreatDetection();
      }
    });
  }

  Future<void> _blockThreats() async {
    for (var i = 0; i < detectedThreats.length; i++) {
      await Future.delayed(Duration(seconds: 3));
      setState(() {
        detectedThreats[i] = "${detectedThreats[i]} - Bloqueada";
      });
    }
    setState(() {
      message = "Todas as ameaças foram neutralizadas!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CyberSec App"),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Barra de progresso
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.blue.shade100,
                  color: Colors.blue.shade900,
                  minHeight: 12,
                ),
                const SizedBox(height: 20),
                // Botão para detectar ameaças
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      detectedThreats.clear();
                      progress = 0.0;
                      message = "";
                    });
                    _startThreatDetection();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: Icon(Icons.search, color: Colors.white),
                  label: const Text(
                    "Detectar Ameaças",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                // Exibindo a lista de ameaças
                Expanded(
                  child: ListView.builder(
                    itemCount: detectedThreats.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          detectedThreats[index],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        leading: Icon(Icons.warning, color: Colors.red),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Botão para bloquear ameaças
                ElevatedButton.icon(
                  onPressed: () async {
                    await _blockThreats();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade800,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: Icon(Icons.block, color: Colors.white),
                  label: const Text(
                    "Bloquear Ameaças",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                // Mensagem de sucesso
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: TextStyle(color: Colors.green.shade400, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 20),
                // Botão para sair
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: Icon(Icons.exit_to_app, color: Colors.white),
                  label: const Text(
                    "Sair",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
