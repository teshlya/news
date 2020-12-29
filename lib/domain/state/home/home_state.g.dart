// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on HomeStateBase, Store {
  final _$newsListAtom = Atom(name: 'HomeStateBase.newsList');

  @override
  NewsList get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(NewsList value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStateBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$errorLoadingAtom = Atom(name: 'HomeStateBase.errorLoading');

  @override
  bool get errorLoading {
    _$errorLoadingAtom.reportRead();
    return super.errorLoading;
  }

  @override
  set errorLoading(bool value) {
    _$errorLoadingAtom.reportWrite(value, super.errorLoading, () {
      super.errorLoading = value;
    });
  }

  final _$getNewsListAsyncAction = AsyncAction('HomeStateBase.getNewsList');

  @override
  Future<void> getNewsList() {
    return _$getNewsListAsyncAction.run(() => super.getNewsList());
  }

  @override
  String toString() {
    return '''
newsList: ${newsList},
isLoading: ${isLoading},
errorLoading: ${errorLoading}
    ''';
  }
}
