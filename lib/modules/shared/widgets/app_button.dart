import 'package:be_the_hero/core/core.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary: AppColors.red),
        child: Container(
          height: size.height * 0.06,
          width: size.width,
          child: Center(child: Text(label, style: AppTextStyles.button)),
        )
    );
  }
}