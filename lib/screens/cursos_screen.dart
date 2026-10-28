import 'package:flutter/material.dart';

import '../data/dados.dart';
import '../theme.dart';
import '../widgets/chip_button.dart';
import '../widgets/suap_card.dart';
import 'curso_screen.dart';

class CursosScreen extends StatelessWidget {
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cursos oferecidos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SuapCard(
            titulo: 'Cursos do Campus Salgueiro',
            children: [
              for (final curso in cursos)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(curso.icone, color: AppColors.teal),
                  title: Text(
                    curso.nome,
                    style: const TextStyle(color: AppColors.teal),
                  ),
                  subtitle: Text('${curso.modalidade} • ${curso.duracao}'),
                  trailing: const Icon(Icons.chevron_right,
                      color: AppColors.teal),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CursoScreen(curso: curso),
                    ),
                  ),
                ),
            ],
          ),
          const Row(children: [BotaoVoltar()]),
        ],
      ),
    );
  }
}
