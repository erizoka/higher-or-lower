import 'package:flutter/material.dart';
import 'package:higher_or_lower/controller/helper/cards_variables.dart';

import '../../controller/cards_controller.dart';

class ResultAnimation extends StatelessWidget {
  final CardsController controller;
  const ResultAnimation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    bool won = controller.gameResult.value == GameResult.win;

    return AnimatedBuilder(
      animation: controller.resultAnimation,
      builder: (context, child) {
        return Center(
          child: Transform.scale(
            scale: controller.resultAnimation.value,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: won
                      ? [
                    const Color(0xFF10B981),
                    const Color(0xFF059669),
                  ]
                      : [
                    const Color(0xFFEF4444),
                    const Color(0xFFF97316),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Text(
                won ? '🎉 Acertou!' : '😢 Errou!',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
