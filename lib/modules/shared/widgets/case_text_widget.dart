import 'package:be_the_hero/core/core.dart';
import 'package:flutter/material.dart';

class CaseTextWidget extends StatelessWidget {
  final String label;
  final int maxLines;
  final double topPadding;
  final double bottomPadding;

  const CaseTextWidget({
    Key? key,
    required this.label,
    this.maxLines = 1,
    this.topPadding = 5,
    this.bottomPadding = 20
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Text(
        label,
        style: AppTextStyles.caseBody,
        textAlign: TextAlign.justify,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      )
    );
  }
}
