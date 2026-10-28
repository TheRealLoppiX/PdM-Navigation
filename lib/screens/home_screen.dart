import 'package:flutter/material.dart';

import '../data/dados.dart';
import '../widgets/chip_button.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/rodape.dart';
import '../widgets/suap_card.dart';
import 'campus_screen.dart';
import 'contato_detalhe_screen.dart';
import 'contatos_screen.dart';
import 'curso_screen.dart';
import 'cursos_screen.dart';

class HomeScreen extends StatelessWidget {
  final String nomeEstudante;

  const HomeScreen({super.key, required this.nomeEstudante});

  void _abrir(BuildContext context, Widget tela) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => tela));
  }

  @override
  Widget build(BuildContext context) {
    final primeiroNome = nomeEstudante.split(' ').first;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'campus em foco',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MenuLateral(nomeEstudante: nomeEstudante),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SuapCard(
                  titulo: 'Início',
                  children: [
                    CaixaDestaque(
                      icone: Icons.school,
                      titulo: 'Olá, $primeiroNome!',
                      subtitulo: 'IFSertãoPE – Campus Salgueiro',
                      valor: '${cursos.length} cursos',
                      onTap: () => _abrir(context, const CursosScreen()),
                    ),
                  ],
                ),
                SuapCard(
                  titulo: 'Campus',
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ChipButton(
                          icone: Icons.info,
                          texto: 'Sobre o campus',
                          onPressed: () =>
                              _abrir(context, const CampusScreen()),
                        ),
                        ChipButton(
                          icone: Icons.place,
                          texto: 'Localização e estrutura',
                          onPressed: () =>
                              _abrir(context, const CampusScreen()),
                        ),
                      ],
                    ),
                  ],
                ),
                SuapCard(
                  titulo: 'Ensino',
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ChipButton(
                          icone: Icons.language,
                          texto: 'Sistemas para Internet',
                          onPressed: () => _abrir(
                            context,
                            const CursoScreen(
                                curso: cursoSistemasParaInternet),
                          ),
                        ),
                        ChipButton(
                          icone: Icons.search,
                          texto: 'Cursos oferecidos',
                          onPressed: () =>
                              _abrir(context, const CursosScreen()),
                        ),
                      ],
                    ),
                  ],
                ),
                SuapCard(
                  titulo: 'Central de Serviços',
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ChipButton(
                          icone: Icons.list,
                          texto: 'Contatos úteis',
                          onPressed: () =>
                              _abrir(context, const ContatosScreen()),
                        ),
                        ChipButton(
                          icone: Icons.add,
                          texto: 'Falar com a secretaria',
                          principal: true,
                          onPressed: () => _abrir(
                            context,
                            const ContatoDetalheScreen(
                                contato: contatoSecretaria),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Rodape(),
        ],
      ),
    );
  }
}
