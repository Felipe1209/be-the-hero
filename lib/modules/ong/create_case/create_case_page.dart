import 'package:be_the_hero/core/core.dart';
import 'package:be_the_hero/modules/ong/create_case/create_case_controller.dart';
import 'package:be_the_hero/modules/shared/models/case_model.dart';
import 'package:be_the_hero/modules/shared/widgets/app_button.dart';
import 'package:be_the_hero/modules/shared/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class CreateCasePage extends StatefulWidget {
  const CreateCasePage({Key? key}) : super(key: key);

  @override
  _CreateCasePageState createState() => _CreateCasePageState();
}

class _CreateCasePageState extends State<CreateCasePage> {
  final controller = CreateCaseController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerValue = TextEditingController();
  late CaseModel caseModel;
  String title = 'CADASTRAR CASO';
  String buttonSave = 'Cadastrar';
  String buttonCancel = 'Cancelar';

  _save() async{
    if(_formKey.currentState!.validate()){
      if(buttonSave == 'Cadastrar'){
        await controller.saveCase(
          name: _controllerTitle.text,
          description: _controllerDescription.text,
          value: _controllerValue.text);
      } else{
        await controller.editCase(
          id: caseModel.id,
          name: _controllerTitle.text,
            description: _controllerDescription.text,
            value: _controllerValue.text);
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Caso salvo com sucesso!', style: AppTextStyles.button, textAlign: TextAlign.center),
            duration: Duration(seconds: 2),
            backgroundColor: AppColors.red,
      ));
      buttonCancel = 'Voltar';
      setState(() {});
    }
  }

  @override
  void initState() {
    controller.getUserData();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        caseModel = ModalRoute.of(context)!.settings.arguments as CaseModel;
        setState(() {
          title = 'EDITAR CASO';
          buttonSave = 'Salvar';
          _controllerTitle.text = caseModel.name;
          _controllerDescription.text = caseModel.description;
          _controllerValue.text = caseModel.value;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.red),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.02),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            Text(title, style: AppTextStyles.mainTitle),
            SizedBox(height: 20),
            InputWidget(controller: _controllerTitle, hint: 'Nome:'),
            InputWidget(controller: _controllerDescription, hint: 'Descrição:', maxLines: 6),
            InputWidget(controller: _controllerValue, hint: 'Valor (em reais):', keyboard: TextInputType.number),
            SizedBox(height: 20),
            Row(children: [
              Expanded(child: AppButton(label: buttonCancel, onPressed: ()=> Navigator.pop(context))),
              SizedBox(width: 20),
              Expanded(child: AppButton(label: buttonSave, onPressed: _save))
            ]),
          ]),
          ),
    ));
  }
}
