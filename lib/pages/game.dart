import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:higher_or_lower/components/card_stack_versus.dart';
import 'package:higher_or_lower/components/gradient_background.dart';
import 'package:higher_or_lower/components/guess_button.dart';

import '../components/widgets/streak_widget.dart';
import '../components/widgets/title_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleWidget(fontSize: 30,),
              Text('Adivinhe a próxima carta!',
                style: GoogleFonts.manrope(textStyle: TextStyle(fontSize: 12)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreakWidget(hasTrophy: false, text: 'Streak Atual',),
                    SizedBox(width: 25,),
                    StreakWidget(hasTrophy: true, text: 'Melhor',)
                  ],
                ),
              ),
              CardStackVersus(),
              SizedBox(height: 30,),
              GuessButton(isUp: true, onPressed: (){},),
              GuessButton(isUp: false, onPressed: (){},),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white12,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white24, width: 1),
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.settings_backup_restore_rounded),
                    SizedBox(width: 10,),
                    Text('Voltar ao Menu')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
