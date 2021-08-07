import 'package:flutter/material.dart';
import 'package:news_mih_2/news_details.dart';

import 'news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel newsModel;
  NewsCard({required this.newsModel});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return NewsDetails(newsModel: newsModel);
          },
        ));
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.network(
                  newsModel.urlToImage!.isEmpty
                      ? "https://i.imgflip.com/5i94mn.jpg"
                      : newsModel.urlToImage!,
                  height: size.height * 0.33,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      color: Colors.pink,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        newsModel.title ?? 'some title',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(newsModel.description ?? 'some description'),
            ),
          ],
        ),
      ),
    );
  }
}
