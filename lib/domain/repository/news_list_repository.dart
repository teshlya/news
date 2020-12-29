import 'package:news/domain/model/news_list.dart';

abstract class NewsListRepository {
  Future<NewsList> getNewsList();
}
