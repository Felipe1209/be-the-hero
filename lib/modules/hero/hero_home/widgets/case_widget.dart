import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/hero/hero_home/widgets/case_details_widget.dart';
import 'package:be_the_hero/modules/shared/widgets/case_text_widget.dart';
import 'package:flutter/material.dart';
import '../hero_home_controller.dart';

class CaseWidget extends StatelessWidget {
  final int index;
  final HeroHomeController controller;

  const CaseWidget({
    Key? key,
    required this.index,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
          height: 180,
          width: size.width,
          padding: EdgeInsets.fromLTRB(24, 24, 12, 12),
          child: Column(
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
                  Text('VALOR: ', style: AppTextStyles.caseTitle),
                  CaseTextWidget(label: 'R\$ ' + controller.caseList[index].value, bottomPadding: 0, topPadding: 0),
                ]),
                SizedBox(height: 10),
                TextButton(child: Text('+ DETALHES', style: AppTextStyles.caseTextButton),
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                      return CaseDetailsWidget(controller: controller, index: index);
                    });
                  })
              ])
      ),
    );
  }
}
