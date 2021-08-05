import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({
    this.details = "",
    this.imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt9PB1rUXNpra-kd0tRLsnx9jN0WHJyh1ACA&usqp=CAU",
    required this.link,
    this.title = "",
  });
  final String title;
  final String imageUrl;
  final String link;
  final String details;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          title,
          style: TextStyle(color: Colors.blue),
        ),
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
                  imageUrl,
                  height: size.height * 0.45,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                details,
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
