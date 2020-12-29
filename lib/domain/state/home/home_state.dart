import 'package:mobx/mobx.dart';
import 'package:news/domain/model/news_list.dart';
import 'package:news/domain/repository/news_list_repository.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._newsListRepository);

  final NewsListRepository _newsListRepository;
  @observable
  NewsList newsList;

  @observable
  bool isLoading = false;

  @observable
  bool errorLoading = false;

  @action
  Future<void> getNewsList() async {
    isLoading = true;
    final data = await _newsListRepository.getNewsList();
    isLoading = false;
    if (data == null || data.news == null || data.news.isEmpty) {
      errorLoading = true;
    } else {
      _fillList(data);
    }
  }

  void _fillList(NewsList data) {
    if (newsList == null)
      newsList = data;
    else
      newsList.news.addAll(data.news);
    errorLoading = false;
  }
}
