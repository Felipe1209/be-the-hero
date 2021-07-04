import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/login/login_page.dart';
import 'package:be_the_hero/modules/login/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:be_the_hero/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'modules/hero/hero_home/hero_home_page.dart';
import 'modules/ong/create_case/create_case_page.dart';
import 'modules/ong/ong_home/ong_home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      print(e);
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_error) {
      return Material(child: Center(child: Text('Erro ao inicializar o Firebase', textDirection: TextDirection.ltr),),);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Center(child: CircularProgressIndicator());
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash' : (context) => SplashPage(),
        '/login' : (context) => LoginPage(),
        '/signup' : (context) => SignUpPage(),
        '/ong-home' : (context) => OngHomePage(),
        '/create-edit' : (context) => CreateCasePage(),
        '/hero-home' : (context) => HeroHomePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: AppColors.background
      ),
    );
  }
}
