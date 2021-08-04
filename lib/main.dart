import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.home,
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Field has been added",
              ),
              duration: Duration(seconds: 3),
            ),
          );
        },
        label: Text(
          "Add Field",
          style: TextStyle(
            color: Colors.pink,
          ),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.pink,
        ),
        backgroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: index,
        children: [
          NewsCard(link: "", title: "article1"),
          NewsCard(link: "", title: "article2"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int value) {
          index = value;
          setState(() {});
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.save,
            ),
            label: "Saved",
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String link;
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
    return Material(
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
                imageUrl,
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
                      title,
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
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
