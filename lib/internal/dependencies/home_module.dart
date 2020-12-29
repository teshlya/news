

import 'package:news/domain/state/home/home_state.dart';
import 'package:news/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.newsRepository(),
    );
  }
}
