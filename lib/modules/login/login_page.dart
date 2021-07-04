import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/login/login_controller.dart';
import 'package:be_the_hero/modules/login/widgets/sign_up_bottom_button.dart';
import 'package:be_the_hero/modules/shared/widgets/app_button.dart';
import 'package:be_the_hero/modules/shared/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  void _login() {
    controller.login(
        email: controllerEmail.text,
        password: controllerPassword.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.01),
          child: SingleChildScrollView(
            child: Column(children: [
                Image.asset(AppImages.login, height: size.height * 0.3),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                  child: Row(children: [
                    Expanded(flex: 2, child: Text('Quero ajudar: ', style: AppTextStyles.mainTitle)),
                    Expanded(child: AppButton(label: 'Acessar', onPressed: () => Navigator.pushReplacementNamed(context, '/hero-home')))
                  ]),
                ),
                Text('Faça login de sua ONG', style: AppTextStyles.mainTitle),
                SizedBox(height: size.height * 0.01),
                InputWidget(controller: controllerEmail, hint: 'E-mail:', keyboard: TextInputType.emailAddress),
                InputWidget(controller: controllerPassword, hint: 'Senha:', obscure: true),
                AppButton(label: 'Entrar', onPressed: _login),
                SignupBottomButton(label: 'Não tenho cadastro', icon: Icons.login, onTap: () => Navigator.pushNamed(context, '/signup')),
                Image.asset(AppImages.logo, height: size.height * 0.05)
            ]),
          ),
      )),
    );
  }
}
