import 'package:flutter/material.dart';

import 'news_card.dart';
import 'news_model.dart';

class ListViewArticles extends StatelessWidget {
  const ListViewArticles({
    required this.articles,
  });
  final List<NewsModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: NewsCard(
            newsModel: articles[index],
          ),
        );
      },
    );
  }
}
