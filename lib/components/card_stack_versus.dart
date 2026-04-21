import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higher_or_lower/components/widgets/confetti_animation.dart';
import 'package:higher_or_lower/components/widgets/result_animation.dart';

import '../controller/cards_controller.dart';
import '../controller/helper/cards_variables.dart';

class CardStackVersus extends StatelessWidget {
  CardStackVersus({super.key});
  final controller = Get.find<CardsController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final totalHeight = MediaQuery.heightOf(context) * 0.59;

    return Obx(() => SizedBox(
      height: totalHeight,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              _buildCurrentCard(
                ctx: context,
                hasImg: true,
                img: controller.currentCard.value.image
              ),
              ScaleTransition(
                alignment: Alignment.center,
                scale: controller.versusAnimation,
                child: Text('VS', style: GoogleFonts.manrope(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white24)
                  ),
                )
              ),
              _buildNextCard(context)
            ],
          ),
          if(controller.gameResult.value == GameResult.win)
            ConfettiAnimation(controller: controller),
          if(controller.gameResult.value != GameResult.none)
            ResultAnimation(controller: controller)
      ]),
    ));
  }

  Widget _buildCurrentCard({
    required BuildContext ctx, required bool hasImg, String? img}) {
    final width = MediaQuery.widthOf(ctx) * 0.40;
    final height = MediaQuery.heightOf(ctx) * 0.25;
    return AnimatedBuilder(
        animation: controller.currentCardFlipAnimation,
        builder: (context, child) {
          final angle = controller.currentCardFlipAnimation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle * 2);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              width: width,
              height: height,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white12,
                gradient: !hasImg
                    ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(1.6, -0.4),
                  colors: [
                    Color(0xff510d98),
                    Colors.deepPurple,
                    Colors.purple
                  ],
                ) : null,
                border: Border.all(color: Colors.white24, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: hasImg
                  ? Image.network(
                img!,
                fit: BoxFit.fill,
              )
                  : Center(
                child: Text(
                  '?',
                  style: GoogleFonts.manrope(
                      fontSize: 60,
                      color: Colors.white12
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

  Widget _buildNextCard(BuildContext ctx) {
    final width = MediaQuery.widthOf(ctx) * 0.40;
    final height = MediaQuery.heightOf(ctx) * 0.25;

    return Obx(() {
      final won = controller.gameResult.value == GameResult.win;

      return controller.newCard.value != null
          ? AnimatedBuilder(
        animation: controller.newCardFlipAnimation,
        builder: (context, child) {
          final angle = controller.newCardFlipAnimation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle * 2);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: (won
                        ? const Color(0xFF10B981)
                        : const Color(0xFFEF4444))
                        .withValues(alpha: 0.5),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      controller.newCard.value!.image!,
                      fit: BoxFit.fill,
                      width: width,
                      height: height,
                    ),
                  ),
                  if (controller.gameResult.value != GameResult.none)
                    Positioned(
                      top: -12,
                      right: -12,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: won
                              ? const Color(0xFF10B981)
                              : const Color(0xFFEF4444),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            won ? '✓' : '✗',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      )
      : _buildCurrentCard(ctx: ctx, hasImg: false);
    });
  }
}
