import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStackVersus extends StatefulWidget {
  const CardStackVersus({super.key});

  @override
  State<CardStackVersus> createState() => _CardStackVersusState();
}

class _CardStackVersusState extends State<CardStackVersus>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _versusAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _versusAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        buildCard(ctx: context, hasImg: true, img: 'https://p7.hiclipart.com/preview/911/391/712/ace-of-spades-playing-card-ace-of-hearts-clip-art-deck-cliparts.jpg'),
        ScaleTransition(
          alignment: Alignment.center,
          scale: _versusAnimation,
          child: Text('VS', style: GoogleFonts.manrope(
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white24)
            ),
          )
        ),
        buildCard(ctx: context, hasImg: false)
      ],
    );
  }

  Widget buildCard({required BuildContext ctx, required bool hasImg, String? img}) {
    final width = MediaQuery.widthOf(ctx) * 0.45;
    final height = MediaQuery.heightOf(ctx) * 0.28;
    return Container(
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
    );
  }
}
