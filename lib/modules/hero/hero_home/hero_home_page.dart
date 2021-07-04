import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/hero/hero_home/hero_home_controller.dart';
import 'package:be_the_hero/modules/hero/hero_home/widgets/home_body_widget.dart';
import 'package:flutter/material.dart';

class HeroHomePage extends StatefulWidget {
  const HeroHomePage({Key? key}) : super(key: key);

  @override
  _HeroHomePageState createState() => _HeroHomePageState();
}

class _HeroHomePageState extends State<HeroHomePage> {
  final controller = HeroHomeController();

  @override
  void initState() {
    controller.loadCases();
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
                Container()
              ])
      ),

      body: HomeBodyWidget(controller: controller),
    );
  }
}
