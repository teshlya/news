import 'package:news/domain/model/news.dart';
import 'package:news/domain/model/news_list.dart';

class ApiNewsList {
  final List<News> news;

  ApiNewsList.fromApi(Map<String, dynamic> map)
      :  news = NewsList.fromJson(map).news;
}
