import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/login/sign_up_controller.dart';
import 'package:be_the_hero/modules/login/widgets/sign_up_bottom_button.dart';
import 'package:be_the_hero/modules/shared/models/user_model.dart';
import 'package:be_the_hero/modules/shared/widgets/app_button.dart';
import 'package:be_the_hero/modules/shared/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerState = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final controller = SignUpController();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      UserModel user = UserModel(
          name: controllerName.text,
          email: controllerEmail.text,
          phone: controllerPhone.text,
          city: controllerCity.text,
          state: controllerState.text
      );
      controller.signUp(user: user, password: controllerPassword.text, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.02),
          child: SingleChildScrollView(
            child: Column(children: [
              Image.asset(AppImages.logo),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.04, bottom: size.height * 0.02),
                child: Text('Cadastro', style: AppTextStyles.mainTitle),
              ),
              Text('Faça seu cadastro, entre na plataforma e ajude pessoas a encontrarem os casos da sua ONG.', style: AppTextStyles.inputText),
              SizedBox(height: size.height * 0.02),

              Form(
                key: _formKey,
                child: Column(children: [
                  InputWidget(controller: controllerName, hint: 'Nome da ONG'),
                  InputWidget(controller: controllerEmail, hint: 'E-mail', keyboard: TextInputType.emailAddress),
                  InputWidget(controller: controllerPhone, hint: 'Telefone', keyboard: TextInputType.phone),
                  Row(children: [
                    Expanded(flex: 2, child: InputWidget(controller: controllerCity, hint: 'Cidade')),
                    SizedBox(width: 10),
                    Expanded(child: InputWidget(controller: controllerState, hint: 'UF',
                      validator: (text) {
                        if (text == null || text.length != 2) {
                          return 'O campo deve ser preenchido';
                        }
                        return null;
                      }))
                  ]),
                  InputWidget(controller: controllerPassword, hint: 'Senha',
                    validator: (text) {
                    if (text == null || text.length < 8) {
                      return 'A senha deve ter pelo menos 8 caracteres';
                    }
                    return null;
                  }),
              ])),

              AppButton(label: 'Cadastrar', onPressed: _signUp),
              SignupBottomButton(label: 'Voltar para o login', icon: Icons.arrow_back, onTap: () => Navigator.pop(context)),
            ]),
          ),

        ),
      ),

    );
  }
}
