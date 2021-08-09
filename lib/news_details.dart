import 'package:flutter/material.dart';
import 'db.dart' as db;
import 'news_model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          newsModel.title ?? "",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: () {
              db.deleteArticle(newsModel.url).then((value) {
                if (value) Navigator.of(context).pop();
              });
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              db.insertArticle(newsModel);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  newsModel.urlToImage ?? "",
                  height: size.height * 0.45,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsModel.description ?? "",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.pink,
                    ),
                    Text(
                      "Read the article",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
