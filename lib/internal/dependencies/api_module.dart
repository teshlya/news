
import 'package:news/data/api_util.dart';
import 'package:news/data/service/news_list_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(NewsListService());
    }
    return _apiUtil;
  }
}
