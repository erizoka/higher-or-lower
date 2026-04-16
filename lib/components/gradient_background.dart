import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(1.6, -0.4),
                colors: [
                  Colors.deepPurple,
                  Color(0xff510d98),
                  Color(0xff35157b),
                  Color(0xff350e8f),
                ],
              )
          ),
          child: child
      ),
    );
  }
}
