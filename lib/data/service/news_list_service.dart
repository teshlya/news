import 'package:dio/dio.dart';
import 'package:news/data/api/api_news_list.dart';
import 'package:news/data/request/get_news_list_body.dart';

class NewsListService {
  static const _BASE_URL = 'https://api.nytimes.com';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiNewsList> getNewsList(GetNewsListBody body) async {
    var response;
    try {
      response = await _dio.get(
        '/svc/topstories/v2/home.json',
        queryParameters: body.toApi(),
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
    return ApiNewsList.fromApi(response.data);
  }
}
