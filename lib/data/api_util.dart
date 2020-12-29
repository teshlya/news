import 'package:meta/meta.dart';
import 'package:news/data/request/get_news_list_body.dart';
import 'package:news/data/service/news_list_service.dart';
import 'package:news/domain/model/news_list.dart';

class ApiUtil {
  final NewsListService _newsListService;

  ApiUtil(this._newsListService);

  Future<NewsList> getNewsList() async {
    final body = GetNewsListBody();
    final result = await _newsListService.getNewsList(body);
    if (result != null)
      return NewsList(news: result.news);
    else
      return null;
  }
}
