import 'package:flutter/material.dart';

import '../data/dados.dart';
import '../theme.dart';
import '../widgets/chip_button.dart';
import '../widgets/suap_card.dart';
import 'contato_detalhe_screen.dart';

class ContatosScreen extends StatelessWidget {
  const ContatosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contatos úteis')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SuapCard(
            titulo: 'Setores e serviços',
            children: [
              for (final contato in contatos)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(contato.icone, color: AppColors.teal),
                  title: Text(
                    contato.setor,
                    style: const TextStyle(color: AppColors.teal),
                  ),
                  subtitle: Text(contato.email),
                  trailing: const Icon(Icons.chevron_right,
                      color: AppColors.teal),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ContatoDetalheScreen(contato: contato),
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
