import 'package:flutter/material.dart';

import '../models/contato.dart';
export 'cursos.dart';

// Fonte: Carta de Serviços ao Usuário do IFSertãoPE (2025).

const telefoneCampus = '(87) 98119-2921';

const contatoSecretaria = Contato(
  setor: 'Controle Acadêmico (Secretaria)',
  descricao:
      'Matrículas, declarações, histórico escolar, diplomas e demais '
      'documentos acadêmicos. Também atende presencialmente no campus.',
  email: 'cs.sca@ifsertao-pe.edu.br',
  icone: Icons.description,
);

const contatos = <Contato>[
  contatoSecretaria,
  Contato(
    setor: 'Assistência Estudantil',
    descricao:
        'Atendimento da equipe multiprofissional (dentista, psicólogo, '
        'nutricionista, assistente social, enfermeiro e médico, conforme '
        'disponibilidade do campus) e programas de auxílio estudantil.',
    email: 'cs.assistenciaestudantil@ifsertao-pe.edu.br',
    prazoResposta: 'Até 72 horas úteis',
    icone: Icons.volunteer_activism,
  ),
  Contato(
    setor: 'NAPNE',
    descricao:
        'Núcleo de Atendimento às Pessoas com Necessidades Educacionais '
        'Específicas: apoio a estudantes com deficiência, transtornos '
        'globais do desenvolvimento, altas habilidades e mobilidade reduzida.',
    email: 'cs.napne@ifsertao-pe.edu.br',
    prazoResposta: 'Até 72 horas úteis',
    icone: Icons.accessibility_new,
  ),
  Contato(
    setor: 'Direção-Geral',
    descricao:
        'Solicitações institucionais, parcerias e apoio à realização de '
        'eventos.',
    email: 'cs.direcao@ifsertao-pe.edu.br',
    prazoResposta: 'Até 7 dias úteis',
    icone: Icons.account_balance,
  ),
  Contato(
    setor: 'Comunicação',
    descricao:
        'Informações gerais sobre o campus, notícias, editais e '
        'atendimento à imprensa.',
    email: 'cs.comunicacao@ifsertao-pe.edu.br',
    telefone: telefoneCampus,
    prazoResposta: 'Até 24 horas',
    icone: Icons.campaign,
  ),
];
