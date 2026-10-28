import 'package:flutter/material.dart';

import '../data/dados.dart';
import '../screens/campus_screen.dart';
import '../screens/contatos_screen.dart';
import '../screens/curso_screen.dart';
import '../screens/cursos_screen.dart';
import '../theme.dart';

class MenuLateral extends StatelessWidget {
  final String nomeEstudante;

  const MenuLateral({super.key, required this.nomeEstudante});

  void _abrir(BuildContext context, Widget tela) {
    Navigator.pop(context); // fecha o menu
    Navigator.push(context, MaterialPageRoute(builder: (_) => tela));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.sidebar,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'campus em foco',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                _caixaIcone(Icons.notifications),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Color(0xFFBDBDBD),
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            nomeEstudante,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                _caixaIcone(Icons.person),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.search, color: AppColors.textoSuave, size: 18),
                SizedBox(width: 10),
                Text('Buscar menu',
                    style: TextStyle(color: AppColors.textoSuave)),
              ],
            ),
            const Divider(color: AppColors.textoSuave, height: 20),
            const SizedBox(height: 8),
            _item(Icons.home, 'Início', () => Navigator.pop(context)),
            _item(Icons.account_balance, 'Sobre o Campus',
                () => _abrir(context, const CampusScreen())),
            _item(Icons.school, 'Ensino', null),
            _subitem('Cursos oferecidos',
                () => _abrir(context, const CursosScreen())),
            _subitem(
                'Sistemas para Internet',
                () => _abrir(context,
                    const CursoScreen(curso: cursoSistemasParaInternet))),
            _item(Icons.support_agent, 'Contatos úteis',
                () => _abrir(context, const ContatosScreen())),
          ],
        ),
      ),
    );
  }

  Widget _caixaIcone(IconData icone) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icone, color: Colors.white, size: 20),
    );
  }

  Widget _item(IconData icone, String texto, VoidCallback? onTap) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 12,
      minLeadingWidth: 0,
      leading: Icon(icone, color: AppColors.teal, size: 20),
      title: Text(texto,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
      onTap: onTap,
    );
  }

  Widget _subitem(String texto, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.only(left: 32),
          title: Text(texto,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
          onTap: onTap,
        ),
        const Divider(
            color: AppColors.sidebarDivisor, height: 1, indent: 32),
      ],
    );
  }
}
