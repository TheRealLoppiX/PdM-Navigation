import 'package:flutter/material.dart';

class Disciplina {
  final String nome;
  final int? cargaHoraria;

  const Disciplina(this.nome, [this.cargaHoraria]);
}

class Periodo {
  final String titulo;
  final List<Disciplina> disciplinas;

  const Periodo(this.titulo, this.disciplinas);

  int get cargaHoraria =>
      disciplinas.fold(0, (total, d) => total + (d.cargaHoraria ?? 0));
}

class Curso {
  final String nome;
  final String modalidade;
  final String duracao;
  final String turno;
  final String descricao;
  final IconData icone;
  final String? cargaHorariaTotal;
  final List<String> areasAtuacao;
  final List<Periodo> grade;
  final String? fonteGrade;

  const Curso({
    required this.nome,
    required this.modalidade,
    required this.duracao,
    required this.turno,
    required this.descricao,
    required this.icone,
    this.cargaHorariaTotal,
    this.areasAtuacao = const [],
    this.grade = const [],
    this.fonteGrade,
  });
}
