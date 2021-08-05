import 'package:flutter/material.dart';
import 'package:news_mih_2/news_details.dart';

class NewsCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? link;
  NewsCard({
    this.description =
        "sjhciqsd icj icoqsudj coiqd hcoqsd coqiu qsidu cjisdj cq",
    this.imageUrl = "https://i.imgflip.com/5i94mn.jpg",
    required this.link,
    this.title = "Article Title",
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return NewsDetails(
              link: link ?? 'some link',
              details: description ?? 'some description',
              imageUrl: imageUrl ?? "https://i.imgflip.com/5i94mn.jpg",
              title: title ?? 'some title',
            );
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
                  imageUrl ?? "https://i.imgflip.com/5i94mn.jpg",
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
                        title ?? 'some title',
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
              child: Text(description ?? 'some description'),
            ),
          ],
        ),
      ),
    );
  }
}
