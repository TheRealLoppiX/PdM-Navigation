import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class Rodape extends StatelessWidget {
  const Rodape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.rodape,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sobre o Campus em Foco',
              style: TextStyle(color: Colors.white70, fontSize: 17)),
          SizedBox(height: 14),
          Text(
            'Aplicativo de Serviços do Campus',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 6),
          Text(
            'Informações úteis para os estudantes do IFSertãoPE – '
            'Campus Salgueiro.',
            style: TextStyle(color: AppColors.textoSuave),
          ),
          SizedBox(height: 16),
          _LinkRodape(
            texto: 'Portal do IFSertãoPE',
            url: 'https://ifsertaope.edu.br/salgueiro/',
          ),
          SizedBox(height: 6),
          _LinkRodape(
            texto: 'SUAP',
            url: 'https://suap.ifsertao-pe.edu.br/',
          ),
        ],
      ),
    );
  }
}

/// Link clicável que abre o endereço no navegador.
class _LinkRodape extends StatelessWidget {
  final String texto;
  final String url;

  const _LinkRodape({required this.texto, required this.url});

  Future<void> _abrir(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final abriu = await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
    if (!abriu) {
      messenger.showSnackBar(
        SnackBar(content: Text('Não foi possível abrir $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _abrir(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.link, color: AppColors.textoSuave, size: 16),
            const SizedBox(width: 8),
            Text(
              texto,
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
