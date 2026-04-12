import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:higher_or_lower/components/gradient_background.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationCard1;
  late Animation<double> _animationCard2;
  late Animation<double> _animationCard3;

  Animation<double> buildAnimation(
      double begin, double end, double start, double finish){
    return Tween<double>(begin: begin, end: end).animate(
        CurvedAnimation(parent: _controller,
          curve: Interval(start, finish, curve: Curves.easeInOut)
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _animationCard1 = buildAnimation(1.0, 1.3, 0.0, 0.6);
    _animationCard2 = buildAnimation(1.0, 1.3, 0.2, 0.8);
    _animationCard3 = buildAnimation(1.0, 1.3, 0.4, 1.0);

    Future.delayed(const Duration(seconds: 3), () => Get.offAll(const HomePage()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScaleTransition(
                  scale: _animationCard1,
                  child: Transform.rotate(
                    angle: -math.pi / 12.0,
                    child: Text('🂡', style: TextStyle(
                      color: Colors.black,
                      fontSize: 100
                    ),),
                  ),
                ),
                ScaleTransition(
                scale: _animationCard2,
                child: Text('🃏', style: TextStyle(
                    fontSize: 100
                  ),),
                ),
                ScaleTransition(
                scale: _animationCard3,
                child: Transform.rotate(
                    angle: math.pi / 12.0,
                    child: Text('🂱', style: TextStyle(
                      color: Colors.black,
                      fontSize: 100
                    ),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: LoadingAnimationWidget.waveDots(
                  color: Colors.white24,
                  size: MediaQuery.widthOf(context) * 0.1,
                ),
              ),
            )
          ],
        )
    );
  }
}
