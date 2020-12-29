import 'package:news/domain/model/news.dart';

class NewsList {
  final List<News> news;

  NewsList({
    this.news,
  });

  factory NewsList.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['results'];
    List<News> news = list.map((i)=>News.fromJson(i)).toList();

    return new NewsList(
      news: news,
    );
  }
}
