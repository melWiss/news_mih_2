import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'news_model.dart';

Future<File> getDB() async {
  var path = join((await getApplicationDocumentsDirectory()).path, 'db.json');
  var file = File(path);
  if (!file.existsSync()) file.createSync(recursive: true);
  return file;
}

Future<List<NewsModel>> getArticles() async {
  var db = await getDB();
  var stringData = db.readAsStringSync();
  if (stringData.isEmpty) return [];
  List listArticlesData = jsonDecode(stringData);
  var listArticles = List<NewsModel>.generate(
    listArticlesData.length,
    (index) =>
        NewsModel.fromMap(listArticlesData[index] as Map<String, dynamic>),
  );
  return listArticles;
}

Future<bool> checkArticleExistence(String url) async {
  var listNewsModel = await getArticles();
  if (listNewsModel.isEmpty) return false;
  try {
    var verif = listNewsModel.singleWhere((element) => element.url == url);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> insertArticle(NewsModel newsModel) async {
  if (!(await checkArticleExistence(newsModel.url))) {
    var articles = await getArticles();
    articles.add(newsModel);
    var db = await getDB();
    List articlesData = List.generate(
      articles.length,
      (index) => articles[index].toMap(),
    );
    db.writeAsStringSync(jsonEncode(articlesData));
    return true;
  }
  return false;
}

Future<bool> deleteArticle(String url) async {
  if (await checkArticleExistence(url)) {
    var articles = await getArticles();
    articles.removeWhere((element) => element.url == url);
    var db = await getDB();
    List articlesData = List.generate(
      articles.length,
      (index) => articles[index].toMap(),
    );
    db.writeAsStringSync(jsonEncode(articlesData));
    return true;
  }
  return false;
}
