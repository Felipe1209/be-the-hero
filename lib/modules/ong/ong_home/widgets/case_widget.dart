import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/ong/ong_home/ong_home_controller.dart';
import 'package:be_the_hero/modules/shared/widgets/case_text_widget.dart';
import 'package:flutter/material.dart';

class CaseWidget extends StatelessWidget {
  final int id;
  final OngHomeController controller;

  const CaseWidget({
    Key? key,
    required this.id,
    required this.controller
  }) : super(key: key);

  void _delete({required BuildContext context}){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Deletar caso', style: AppTextStyles.caseTitle),
        content: Text('Você tem certeza que deseja deletar este caso?', style: AppTextStyles.caseBody),
        actions: [
          TextButton(
              child: Text('Sim'),
              onPressed: () async{
                await controller.deleteCase(position: id);
                Navigator.pop(context);
              }),
          TextButton(
              child: Text('Não'),
              onPressed: () => Navigator.pop(context)
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
        padding: EdgeInsets.fromLTRB(24, 24, 12, 24),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CASO:', style: AppTextStyles.caseTitle),
                CaseTextWidget(label: controller.casesList[id].name),

                Text('DESCRIÇÃO:', style: AppTextStyles.caseTitle),
                CaseTextWidget(label: controller.casesList[id].description, maxLines: 3),

                Text('VALOR:', style: AppTextStyles.caseTitle),
                CaseTextWidget(label: 'R\$ ${controller.casesList[id].value}', bottomPadding: 0)
            ]),
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: Icon(Icons.edit, color: AppColors.red),
                onPressed: (){
                  Navigator.pushNamed(context, '/create-edit', arguments: controller.casesList[id])
                      .then((value) async => {await controller.getCases()});
              }),
              IconButton(icon: Icon(Icons.delete, color: AppColors.red),
                onPressed: () => _delete(context: context))
          ])
        ])
      ),
    );
  }
}
