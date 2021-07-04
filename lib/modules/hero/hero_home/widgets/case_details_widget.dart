import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/hero/hero_home/hero_home_controller.dart';
import 'package:be_the_hero/modules/shared/widgets/case_text_widget.dart';
import 'package:flutter/material.dart';


class CaseDetailsWidget extends StatelessWidget {
  final HeroHomeController controller;
  final int index;

  const CaseDetailsWidget({
    Key? key,
    required this.controller,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text('ONG: ', style: AppTextStyles.caseTitle),
            CaseTextWidget(label: controller.caseList[index].ongName, bottomPadding: 0, topPadding: 0),
          ]),
          SizedBox(height: 10),
          Row(children: [
            Text('CASO: ', style: AppTextStyles.caseTitle),
            CaseTextWidget(label: controller.caseList[index].name, bottomPadding: 0, topPadding: 0),
          ]),
          SizedBox(height: 10),
          Row(children: [
            Text('DESCRIÇÃO: ', style: AppTextStyles.caseTitle),
            CaseTextWidget(label: controller.caseList[index].description, bottomPadding: 0, topPadding: 0),
          ]),
          SizedBox(height: 10),
          Row(children: [
            Text('VALOR: ', style: AppTextStyles.caseTitle),
            CaseTextWidget(label: 'R\$ ' + controller.caseList[index].value, bottomPadding: 0, topPadding: 0),
          ]),
          SizedBox(height: 10),
          Row(children: [
            Text('EMAIL: ', style: AppTextStyles.caseTitle),
            CaseTextWidget(label: controller.ongList[index].email, bottomPadding: 0, topPadding: 0),
          ]),
          SizedBox(height: 10),
          Row(children: [
            Text('TELEFONE: ', style: AppTextStyles.caseTitle),
            CaseTextWidget(label: controller.ongList[index].phone, bottomPadding: 0, topPadding: 0),
          ]),
      ])
    );
  }
}
