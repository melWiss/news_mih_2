import 'package:flutter/material.dart';
import 'package:news_mih_2/state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'db.dart' as db;
import 'news_model.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.newsModel.title ?? "",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (await db.checkArticleExistence(widget.newsModel.url)) {
                newsState.deleteArticle(widget.newsModel);
                Navigator.of(context).pop();
              } else {
                newsState.insertArticle(widget.newsModel);
                setState(() {});
              }
            },
            icon: newsState.checkExistence(widget.newsModel.url)
                ? Icon(Icons.delete)
                : Icon(Icons.save),
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
                  widget.newsModel.urlToImage ?? "",
                  height: size.height * 0.45,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.newsModel.description ?? "",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  launch(widget.newsModel.url);
                },
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
