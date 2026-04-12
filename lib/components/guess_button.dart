import 'package:flutter/material.dart';

class GuessButton extends StatelessWidget {
  final bool isUp;
  final VoidCallback onPressed;
  const GuessButton({super.key, required this.isUp, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isUp ? Colors.green : Colors.red
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isUp ? Icons.trending_up : Icons.trending_down),
            SizedBox(width: 10,),
            Text(isUp ? 'Maior' : 'Menor')
          ],
        )
    );
  }
}
