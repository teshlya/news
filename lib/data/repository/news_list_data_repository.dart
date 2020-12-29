import 'package:news/data/api_util.dart';
import 'package:news/domain/model/news_list.dart';
import 'package:news/domain/repository/news_list_repository.dart';

class NewsListDataRepository extends NewsListRepository {
  final ApiUtil _apiUtil;

  NewsListDataRepository(this._apiUtil);

  @override
  Future<NewsList> getNewsList() {
    return _apiUtil.getNewsList();
  }
}
