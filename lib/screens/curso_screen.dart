import 'package:flutter/material.dart';

import '../models/curso.dart';
import '../theme.dart';
import '../widgets/chip_button.dart';
import '../widgets/suap_card.dart';
import 'contatos_screen.dart';

/// Detalhes de um curso, recebido pelo construtor.
class CursoScreen extends StatelessWidget {
  final Curso curso;

  const CursoScreen({super.key, required this.curso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(curso.nome)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SuapCard(
            titulo: curso.nome,
            children: [
              CaixaDestaque(
                icone: curso.icone,
                titulo: 'Duração do curso',
                subtitulo: '${curso.modalidade} • ${curso.turno}',
                valor: curso.duracao,
              ),
              const SizedBox(height: 16),
              Text(
                curso.descricao,
                style: const TextStyle(color: AppColors.texto, height: 1.5),
              ),
            ],
          ),
          if (curso.areasAtuacao.isNotEmpty)
            SuapCard(
              titulo: 'Áreas de atuação',
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final area in curso.areasAtuacao) Etiqueta(area),
                  ],
                ),
              ],
            ),
          SuapCard(
            titulo: 'Matriz curricular',
            children: [
              if (curso.cargaHorariaTotal != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Carga horária total: ${curso.cargaHorariaTotal}',
                    style: const TextStyle(
                        color: AppColors.texto, fontWeight: FontWeight.w500),
                  ),
                ),
              if (curso.grade.isEmpty)
                const Text(
                  'A grade deste curso ainda não foi cadastrada. '
                  'Consulte o PPC no site do campus.',
                  style: TextStyle(color: AppColors.textoSuave),
                )
              else ...[
                for (final periodo in curso.grade) _PeriodoTile(periodo),
                if (curso.fonteGrade != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Fonte: ${curso.fonteGrade}',
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textoSuave),
                    ),
                  ),
              ],
            ],
          ),
          Row(
            children: [
              const BotaoVoltar(),
              const SizedBox(width: 10),
              ChipButton(
                icone: Icons.support_agent,
                texto: 'Contatos',
                principal: true,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ContatosScreen()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Semestre/módulo expansível com suas disciplinas.
class _PeriodoTile extends StatelessWidget {
  final Periodo periodo;

  const _PeriodoTile(this.periodo);

  @override
  Widget build(BuildContext context) {
    final ch = periodo.cargaHoraria;

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      shape: const Border(),
      collapsedShape: const Border(),
      iconColor: AppColors.teal,
      collapsedIconColor: AppColors.teal,
      leading: const Icon(Icons.menu_book, color: AppColors.teal, size: 20),
      title: Text(
        periodo.titulo,
        style: const TextStyle(color: AppColors.teal, fontSize: 15),
      ),
      subtitle: Text(
        '${periodo.disciplinas.length} disciplinas'
        '${ch > 0 ? ' • $ch h' : ''}',
        style: const TextStyle(fontSize: 12),
      ),
      children: [
        for (final disciplina in periodo.disciplinas)
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 36),
            title: Text(disciplina.nome,
                style: const TextStyle(fontSize: 14)),
            trailing: disciplina.cargaHoraria == null
                ? null
                : Etiqueta('${disciplina.cargaHoraria} h'),
          ),
      ],
    );
  }
}
