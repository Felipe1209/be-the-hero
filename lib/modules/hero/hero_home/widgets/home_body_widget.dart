import 'package:be_the_hero/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../hero_home_controller.dart';
import '../hero_home_state.dart';
import 'case_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  final HeroHomeController controller;

  const HomeBodyWidget({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(builder: (BuildContext context) {
      switch(controller.state.runtimeType){
        case (HeroHomeStateLoading):
          {
            return Center(child: CircularProgressIndicator());
          }

        case (HeroHomeStateFailure):
          {
            return Center(
                child: Text((controller.state as HeroHomeStateFailure).message));
          }

        case (HeroHomeStateSuccess):
          {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.02),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Seja bem-vindo(a)!', style: AppTextStyles.mainTitle),
                      Text('Navegue entre os ${controller.caseList.length} casos cadastrados para ver mais informações!', style: AppTextStyles.homeSubtitle),
                      SizedBox(height: 10),
                      Column(children: [
                        if(controller.caseList.isNotEmpty) ...[
                          for (int i = 0; i < controller.caseList.length; i++)
                            CaseWidget(
                              index: i,
                              controller: controller,
                            )
                        ] else ...[
                          SizedBox(height: 50),
                          Text('Que pena! Parece que não temos casos cadastrados no momento', style: AppTextStyles.homeSubtitle)
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
