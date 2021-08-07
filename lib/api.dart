import 'dart:convert';

import 'package:http/http.dart' as http;

import 'news_model.dart';

Future<List<NewsModel>> getArticles() async {
  var response = await http.get(
    Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=f599cb8706914e578b866c0d0dc58a4f"),
  );
  //print(response.body);
  var data = jsonDecode(response.body);
  List articles = data['articles'];
  List<NewsModel> articlesModels = List<NewsModel>.generate(
    data['articles'].length,
    (index) => NewsModel.fromMap(
      data['articles'][index],
    ),
  );
  return articlesModels;
}
