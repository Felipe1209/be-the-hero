// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ong_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OngHomeController on _OngHomeControllerBase, Store {
  final _$stateAtom = Atom(name: '_OngHomeControllerBase.state');

  @override
  OngHomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(OngHomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$getCasesAsyncAction = AsyncAction('_OngHomeControllerBase.getCases');

  @override
  Future getCases() {
    return _$getCasesAsyncAction.run(() => super.getCases());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
