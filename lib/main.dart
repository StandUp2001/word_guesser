import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_guesser/buttons.dart';
import 'package:word_guesser/cards.dart';
import 'package:word_guesser/top_bar.dart';
import 'package:word_guesser/words.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Guesser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF1D2428),
      appBar: TopBar(title: 'Word Guesser'),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return BodyWidgetState();
  }
}

class BodyWidgetState extends State<BodyWidget> {
  List<String> words = [];
  final Random random = Random();

  void generateWords() {
    setState(() {
      words.clear();
      while (words.length < 5) {
        final word = wordsList[random.nextInt(wordsList.length)];
        if (!words.contains(word)) {
          words.add(word);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Cards(words: words),
          ButtonRow(onPress: generateWords),
        ],
      ),
    );
  }
}
