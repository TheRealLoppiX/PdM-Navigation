import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme.dart';

void main() => runApp(const CampusEmFocoApp());

class CampusEmFocoApp extends StatelessWidget {
  const CampusEmFocoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus em Foco',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      home: const HomeScreen(nomeEstudante: 'Arthur Vasconcelos'),
    );
  }
}
