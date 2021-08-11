import 'package:flutter/material.dart';
import 'package:news_mih_2/state.dart';
import 'api.dart';

import 'articles_list.dart';
import 'news_card.dart';
import 'news_model.dart';
import 'db.dart' as db;

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
    getArticles();
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
          StreamBuilder<List<NewsModel>?>(
              stream: newsState.listNewsApiStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListViewArticles(
                    articles: snapshot.data!,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Something wen wrong"),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
          StreamBuilder<List<NewsModel>?>(
              stream: newsState.listNewsDbStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListViewArticles(
                    articles: snapshot.data!,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Something wen wrong"),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
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
