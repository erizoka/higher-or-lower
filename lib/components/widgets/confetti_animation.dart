import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cards_controller.dart';

class ConfettiAnimation extends StatelessWidget {
  final CardsController controller;
  const ConfettiAnimation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.confettiAnimation,
        builder: (context, child) {
          return SizedBox.expand(
            child: Stack(
              children: List.generate(20, (i) {
                final colors = [
                  const Color(0xFFFBBF24),
                  const Color(0xFFF59E0B),
                  const Color(0xFFEC4899),
                  const Color(0xFF8B5CF6),
                  const Color(0xFF3B82F6),
                ];

                final random = Random(i);
                final startX = MediaQuery.of(context).size.width / 2;
                final startY = MediaQuery.of(context).size.height / 2;
                final endX = startX + (random.nextDouble() - 0.5) * 400;
                final endY = startY + (random.nextDouble() - 0.5) * 400;

                return Positioned(
                  left: startX + (endX - startX) * controller.confettiAnimation.value,
                  top: startY + (endY - startY) * controller.confettiAnimation.value,
                  child: Opacity(
                    opacity: 1 - controller.confettiAnimation.value,
                    child: Transform.scale(
                      scale: controller.confettiAnimation.value * 1.5,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: colors[i % 5],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
    );
  }
}
