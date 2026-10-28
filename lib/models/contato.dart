import 'package:flutter/material.dart';

class Contato {
  final String setor;
  final String descricao;
  final String email;
  final String? telefone;
  final String? prazoResposta;
  final IconData icone;

  const Contato({
    required this.setor,
    required this.descricao,
    required this.email,
    required this.icone,
    this.telefone,
    this.prazoResposta,
  });
}
