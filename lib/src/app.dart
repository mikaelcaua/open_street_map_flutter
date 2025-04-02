import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class OpenStreetMapApp extends StatelessWidget {
  const OpenStreetMapApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Safezone App',
      home: const HomeScreen(),
    );
  }
}
