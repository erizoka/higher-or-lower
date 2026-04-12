import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higher_or_lower/components/widgets/streak_widget.dart';
import 'package:higher_or_lower/components/widgets/title_widget.dart';

import '../components/gradient_background.dart';
import '../routes/app_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🃏', style: TextStyle(fontSize: 100)),
            TitleWidget(fontSize: 60),
            Text(
              'Adivinhe se a próxima carta\né maior ou menor!',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(textStyle: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.game),
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(150),
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.pinkAccent.shade700,
                      Colors.deepPurple,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  constraints: const BoxConstraints(minWidth: 150),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Icon(Icons.play_arrow),
                      SizedBox(width: 10),
                      Text('Jogar', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            StreakWidget(hasTrophy: true, text: 'Melhor Streak',)
          ]
      ),
    );
  }
}
