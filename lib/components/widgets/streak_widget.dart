import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all(color: Colors.white24, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.emoji_events_outlined,
            color: Colors.yellow.shade700,
            size: 35
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Melhor Streak', style: GoogleFonts.manrope(
                  textStyle: TextStyle(fontWeight: FontWeight.w600))
              ),
              Text('7', style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
              )
            ],
          )
        ],
      ),
    );
  }
}
