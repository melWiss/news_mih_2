import 'dart:async';
import 'api.dart' as api;
import 'db.dart' as db;

import 'package:news_mih_2/news_model.dart';

class NewsStateManagement {
  // List<NewsModel>? _listNewsApi;
  List<NewsModel>? _listNewsDb;

  StreamController<List<NewsModel>?> _listNewsApiController =
      StreamController<List<NewsModel>?>();
  StreamController<List<NewsModel>?> _listNewsDbController =
      StreamController<List<NewsModel>?>();

  Stream<List<NewsModel>?> get listNewsApiStream =>
      _listNewsApiController.stream;
  Stream<List<NewsModel>?> get listNewsDbStream => _listNewsDbController.stream;

  StreamSink<List<NewsModel>?> get _listNewsApiSink =>
      _listNewsApiController.sink;
  StreamSink<List<NewsModel>?> get _listNewsDbSink =>
      _listNewsDbController.sink;

  NewsStateManagement() {
    getApiArticles();
    getDbArticles();
  }

  void getApiArticles() {
    api.getArticles().then((value) {
      // _listNewsApi = value;
      _listNewsApiSink.add(value);
    });
  }

  void getDbArticles() {
    db.getArticles().then((value) {
      _listNewsDb = value;
      _listNewsDbSink.add(value);
    });
  }

  bool checkExistence(String url) {
    if (_listNewsDb!.isEmpty) return false;
    try {
      _listNewsDb!.singleWhere((element) => element.url == url);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void insertArticle(NewsModel newsModel) {
    db.insertArticle(newsModel).then((value) {
      if (value) getDbArticles();
    });
  }

  void deleteArticle(NewsModel newsModel) {
    db.deleteArticle(newsModel.url).then((value) {
      if (value) getDbArticles();
    });
  }

  dispose() {
    _listNewsApiController.close();
    _listNewsDbController.close();
  }
}

var newsState = NewsStateManagement();
