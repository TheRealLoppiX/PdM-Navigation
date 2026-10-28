import 'package:flutter/material.dart';

import '../theme.dart';

class SuapCard extends StatelessWidget {
  final String titulo;
  final List<Widget> children;

  const SuapCard({super.key, required this.titulo, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 1,
      shadowColor: Colors.black12,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.texto,
                    ),
                  ),
                ),
                const Icon(Icons.menu, size: 20, color: AppColors.textoSuave),
                const Icon(Icons.arrow_drop_down,
                    size: 16, color: AppColors.textoSuave),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(height: 1),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class CaixaDestaque extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String subtitulo;
  final String valor;
  final VoidCallback? onTap;

  const CaixaDestaque({
    super.key,
    required this.icone,
    required this.titulo,
    required this.subtitulo,
    required this.valor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.destaqueFundo,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.destaqueBorda),
        borderRadius: BorderRadius.circular(3),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icone, color: AppColors.tealClaro, size: 40),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                          fontSize: 16, color: AppColors.texto),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitulo,
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.vermelho),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      valor,
                      style: const TextStyle(
                        fontSize: 34,
                        color: AppColors.vermelho,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Icon(Icons.chevron_right, color: AppColors.teal),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
