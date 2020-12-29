import 'package:news/data/repository/news_list_data_repository.dart';
import 'package:news/domain/repository/news_list_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static NewsListRepository _newsRepository;

  static NewsListRepository newsRepository() {
    if (_newsRepository == null) {
      _newsRepository = NewsListDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _newsRepository;
  }
}
