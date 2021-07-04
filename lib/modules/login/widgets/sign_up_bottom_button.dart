import 'package:be_the_hero/core/core.dart';
import 'package:flutter/material.dart';

class SignupBottomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const SignupBottomButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
        child: GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: AppColors.red),
                  SizedBox(width: 10),
                  Text(label, style: AppTextStyles.caseTitle),
                ]),
            onTap: onTap
        ));
  }
}
