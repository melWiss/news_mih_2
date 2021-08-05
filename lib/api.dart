import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getArticles() async {
  var response = await http.get(
    Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=f599cb8706914e578b866c0d0dc58a4f"),
  );
  //print(response.body);
  var data = jsonDecode(response.body);
  List articles = data['articles'];
  return articles;
}
