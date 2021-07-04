import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/ong/ong_home/ong_home_controller.dart';
import 'package:be_the_hero/modules/ong/ong_home/widgets/home_body_widget.dart';
import 'package:flutter/material.dart';

class OngHomePage extends StatefulWidget {
  const OngHomePage({Key? key}) : super(key: key);

  @override
  _OngHomePageState createState() => _OngHomePageState();
}

class _OngHomePageState extends State<OngHomePage> {
  final controller = OngHomeController();

  @override
  void initState() {
    controller.getCases();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.logo, width: size.height * 0.15),
              Row(children: [
                Text('Sair', style: AppTextStyles.caseTitle),
                IconButton(onPressed: (){controller.signOut(context);}, icon: Icon(Icons.exit_to_app, color: AppColors.red,))
              ])
            ])
      ),

      body: HomeBodyWidget(controller: controller),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.red,
        icon: Icon(Icons.add),
        label: Text('Cadastrar caso'),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onPressed: (){
          Navigator.pushNamed(context, '/create-edit').then((value) async => {await controller.getCases()});
        }
      )


    );
  }
}
