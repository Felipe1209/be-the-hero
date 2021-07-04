import 'package:be_the_hero/core/core.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboard;
  final String hint;
  final bool obscure;
  final int maxLines;
  final String? Function(String?)? validator;

  const InputWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.keyboard = TextInputType.text,
    this.obscure = false,
    this.maxLines = 1,
    this.validator,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.01),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        style: AppTextStyles.inputText,
        obscureText: obscure,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(24, 10, 24, 10),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )
        ),
        validator: validator ?? (text) {
          if (text == null || text.isEmpty) {
            return 'O campo deve ser preenchido';
          }
          return null;
        },

      ),
    );
  }
}
