import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final double fontSize;
  const TitleWidget({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Higher or Lower',
      textAlign: TextAlign.center,
      style: GoogleFonts.archivo(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          )
      )
    );
  }
}
