import 'package:flutter/material.dart';
import 'package:text_to_speech/tts_screen.dart';
//import 'package:flutter_tts/flutter_tts.dart';

// Iniciar la aplicación
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TTSScreen(),
      debugShowCheckedModeBanner: false,
      color: Colors.greenAccent,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
