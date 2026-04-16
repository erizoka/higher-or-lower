import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StreakWidget extends StatelessWidget {
  final bool hasTrophy;
  final String text;
  final int streak;
  const StreakWidget({
    super.key,
    required this.hasTrophy,
    required this.text,
    required this.streak
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.35,
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all(color: Colors.white24, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasTrophy)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.emoji_events_outlined,
                  color: Colors.yellow.shade700,
                  size: 35
                ),
              ),
            if (hasTrophy) SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(text, style: GoogleFonts.manrope(
                        textStyle: TextStyle(fontWeight: FontWeight.w600))
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(streak.toString(), style: GoogleFonts.roboto(
                        textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
