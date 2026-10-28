import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/chip_button.dart';
import '../widgets/suap_card.dart';

class CampusScreen extends StatelessWidget {
  const CampusScreen({super.key});

  static const _estrutura = [
    'Laboratórios de informática',
    'Biblioteca',
    'Refeitório',
    'Auditório',
    'Laboratórios de ciências',
    'Quadra poliesportiva',
    'Wi-Fi institucional',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o Campus')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SuapCard(
            titulo: 'IFSertãoPE – Campus Salgueiro',
            children: [
              Text(
                'O Campus Salgueiro faz parte do Instituto Federal de '
                'Educação, Ciência e Tecnologia do Sertão Pernambucano. '
                'Oferece cursos técnicos, superiores e de formação '
                'continuada, promovendo ensino, pesquisa e extensão no '
                'Sertão Central de Pernambuco.',
                style: TextStyle(color: AppColors.texto, height: 1.5),
              ),
            ],
          ),
          const SuapCard(
            titulo: 'Informações',
            children: [
              _LinhaInfo(rotulo: 'Instituição', valor: 'IFSertãoPE'),
              _LinhaInfo(rotulo: 'Cidade', valor: 'Salgueiro – PE'),
              _LinhaInfo(
                rotulo: 'Endereço',
                valor: 'BR-232, Km 504 – Zona Rural, CEP 56000-000',
              ),
              _LinhaInfo(rotulo: 'Telefone', valor: '(87) 98119-2921'),
              _LinhaInfo(
                rotulo: 'Funcionamento',
                valor: 'Segunda a sexta, manhã, tarde e noite',
              ),
            ],
          ),
          SuapCard(
            titulo: 'Estrutura',
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [for (final item in _estrutura) Etiqueta(item)],
              ),
            ],
          ),
          const Row(children: [BotaoVoltar()]),
        ],
      ),
    );
  }
}

class _LinhaInfo extends StatelessWidget {
  final String rotulo;
  final String valor;

  const _LinhaInfo({required this.rotulo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(rotulo,
                style: const TextStyle(color: AppColors.textoSuave)),
          ),
          Expanded(
            child: Text(
              valor,
              style: const TextStyle(
                  color: AppColors.texto, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
