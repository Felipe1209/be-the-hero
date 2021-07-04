import 'package:be_the_hero/modules/shared/models/case_model.dart';

abstract class HeroHomeState{}

class HeroHomeStateEmpty implements HeroHomeState{}

class HeroHomeStateLoading implements HeroHomeState{}

class HeroHomeStateSuccess implements HeroHomeState{
  final List<CaseModel> cases;

  HeroHomeStateSuccess({
    required this.cases
  });
}

class HeroHomeStateFailure implements HeroHomeState{
  final String message;
  HeroHomeStateFailure({required this.message});
}