import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/ong/ong_home/ong_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../ong_home_state.dart';
import 'case_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  final OngHomeController controller;

  const HomeBodyWidget({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(builder: (BuildContext context) {
      switch(controller.state.runtimeType){
        case (OngHomeStateLoading):
          {
            return Center(child: CircularProgressIndicator());
          }

        case (OngHomeStateFailure):
          {
            return Center(
                child: Text((controller.state as OngHomeStateFailure).message));
          }

        case (OngHomeStateSuccess):
          {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.02),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Olá, ${controller.user.name}!', style: AppTextStyles.mainTitle),
                      Text('Você tem ${controller.casesList.length} caso(s) cadastrado(s)', style: AppTextStyles.homeSubtitle),
                      SizedBox(height: 10),
                      Column(children: [
                        if(controller.casesList.isNotEmpty) ...[
                          for (int i = 0; i < controller.casesList.length; i++)
                            CaseWidget(
                              id: i,
                              controller: controller,
                            )
                        ] else ...[
                          SizedBox(height: 50,),
                          Text('Clique no botão abaixo para cadastrar um caso!', style: AppTextStyles.homeSubtitle)
                        ]
                      ]),
                    ]),
              ),
            );
          }

        default:
          {
            return Container();
          }
      }
    });
  }
}
