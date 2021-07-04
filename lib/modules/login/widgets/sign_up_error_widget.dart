import 'package:be_the_hero/core/core.dart';
import 'package:flutter/material.dart';

class SignupErrorWidget extends StatelessWidget {
  final String title;
  final String content;

  const SignupErrorWidget({
    Key? key,
    required this.title,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: AppTextStyles.caseTitle),
      content: Text(content, style: AppTextStyles.caseBody),
      actions: [
        TextButton(
            child: Text("Fechar"),
            onPressed: () => Navigator.pop(context)
        )
      ],
    );
  }
}