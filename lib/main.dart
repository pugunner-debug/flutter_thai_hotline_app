import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/view/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const FlutterThaiHotlineApp(), 
  );
}

class FlutterThaiHotlineApp extends StatefulWidget {
  const FlutterThaiHotlineApp({super.key});

  @override
  State<FlutterThaiHotlineApp> createState() => _FlutterThaiHotlineAppState();
}

class _FlutterThaiHotlineAppState extends State<FlutterThaiHotlineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: const SplashScreenUi(), 
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.green, // สีพื้นหลังเป็นสีเขียว
      ),
    );
  }
}