import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: const BorderSide(
                width: 2.0,
                color: Color.fromARGB(190, 255, 255, 255),
              ),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
          onPressed: onTap,
          child: Text(
            answerText,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(223, 255, 255, 255),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
