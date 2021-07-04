import 'package:be_the_hero/modules/shared/models/case_model.dart';

abstract class OngHomeState{}

class OngHomeStateEmpty implements OngHomeState{}

class OngHomeStateLoading implements OngHomeState{}

class OngHomeStateSuccess implements OngHomeState{
  final List<CaseModel> cases;

  OngHomeStateSuccess({
    required this.cases
  });
}

class OngHomeStateFailure implements OngHomeState{
  final String message;
  OngHomeStateFailure({required this.message});
}