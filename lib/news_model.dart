class NewsModel {
  String? title;
  String? description;
  String url;
  String? urlToImage;

  NewsModel({
    required this.url,
    this.title = "",
    this.description = "",
    this.urlToImage = "https://i.imgflip.com/5i94mn.jpg",
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      url: map['url'],
      description: map['description'] ?? "",
      title: map['title'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'description': description,
      'title': title,
      'urlToImage': urlToImage,
    };
  }
}
