import 'package:flutter/material.dart';

import '../theme.dart';

class ChipButton extends StatelessWidget {
  final IconData icone;
  final String texto;
  final VoidCallback onPressed;
  final bool principal;

  const ChipButton({
    super.key,
    required this.icone,
    required this.texto,
    required this.onPressed,
    this.principal = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icone, size: 16),
      label: Text(texto),
      style: ElevatedButton.styleFrom(
        backgroundColor: principal ? AppColors.verde : AppColors.chip,
        foregroundColor: principal ? Colors.white : AppColors.texto,
        elevation: 0,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        minimumSize: const Size(0, 34),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}

class BotaoVoltar extends StatelessWidget {
  const BotaoVoltar({super.key});

  @override
  Widget build(BuildContext context) {
    return ChipButton(
      icone: Icons.arrow_back,
      texto: 'Voltar',
      onPressed: () => Navigator.pop(context),
    );
  }
}

class Etiqueta extends StatelessWidget {
  final String texto;

  const Etiqueta(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.chip,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 13, color: AppColors.texto),
      ),
    );
  }
}
