import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/news.dart';

class NewsScreen extends StatefulWidget {

  @override
  _NewsScreenState createState() {
    return new _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {

  List<News> news = [];
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("뉴스 http"),
      ),
      body: isLoading ? Center(child: const CircularProgressIndicator(),) :
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(news[index].title),
                  Text(news[index].content),
                ],
              ),
            );
          }),
    );
  }
}