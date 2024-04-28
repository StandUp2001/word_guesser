import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.words,
  });

  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        for (var i = 1; i <= words.length; i++)
          FlipCard(
            direction: FlipDirection.HORIZONTAL,
            front: FlipCardContent(word: '$i'),
            back: FlipCardContent(word: words[i - 1]),
          ),
      ],
    );
  }
}

class FlipCardContent extends StatelessWidget {
  final String word;

  const FlipCardContent({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        height: 80.0,
        alignment: Alignment.center,
        child: Text(
          word,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1D2428),
          ),
        ),
      ),
    );
  }
}
