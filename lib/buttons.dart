import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  const ButtonText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  final void Function() _generateWords;
  const ButtonRow({
    super.key,
    required void Function() onPress,
  }) : _generateWords = onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const ElevatedButton(
          //   onPressed: null,
          //   child: ButtonText(text: 'Show/Hide All Cards (unimplemented)'),
          // ),
          // Add color to the button
          ElevatedButton(
            onPressed: _generateWords,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            child: const ButtonText(text: 'New Cards'),
          ),
        ],
      ),
    );
  }
}
