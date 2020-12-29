class News {
  String title;
  String abstract;
  String caption;
  String smallImage;
  String fullImage;

  News(
      { this.title, this.abstract, this.caption, this.smallImage, this.fullImage});

  News.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        abstract = json['abstract'],
        caption = json['multimedia'][0]['caption'],
        smallImage =json['multimedia'][1]['url'],
        fullImage = json['multimedia'][0]['url'];
}
