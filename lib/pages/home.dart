import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(1.1, -0.4),
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🃏', style: TextStyle(fontSize: 100)),
            Text(
           'Higher or Lower',
            textAlign: TextAlign.center,
            style: GoogleFonts.archivo(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.white
              )
            ),
            ),
            Text(
              'Adivinhe se a próxima carta\né maior ou menor!',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}
