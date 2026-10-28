import 'package:flutter/material.dart';

import '../models/contato.dart';
import '../theme.dart';
import '../widgets/chip_button.dart';
import '../widgets/suap_card.dart';

/// Detalhes de um setor, recebido pelo construtor.
class ContatoDetalheScreen extends StatelessWidget {
  final Contato contato;

  const ContatoDetalheScreen({super.key, required this.contato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contato.setor)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SuapCard(
            titulo: contato.setor,
            children: [
              Text(
                contato.descricao,
                style: const TextStyle(color: AppColors.texto, height: 1.5),
              ),
              const SizedBox(height: 8),
              _item(Icons.email, 'E-mail', contato.email),
              if (contato.telefone != null)
                _item(Icons.phone, 'Telefone', contato.telefone!),
              if (contato.prazoResposta != null)
                _item(Icons.schedule, 'Prazo de resposta',
                    contato.prazoResposta!),
              _item(Icons.place, 'Local',
                  'Campus Salgueiro – BR-232, Km 504, Zona Rural'),
            ],
          ),
          const Row(children: [BotaoVoltar()]),
        ],
      ),
    );
  }

  Widget _item(IconData icone, String rotulo, String valor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icone, color: AppColors.teal),
      title: Text(valor, style: const TextStyle(color: AppColors.texto)),
      subtitle: Text(rotulo),
    );
  }
}
