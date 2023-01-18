import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/news_provider.dart';

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
  NewsProviders newsProvider = NewsProviders();

  Future initNews() async {
    news = await newsProvider.getNews();
  }

  @override
  void initState() {
    super.initState();
    initNews().then((_) {
      setState(() {
        isLoading = false;
      });
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
          crossAxisCount: 2,
          childAspectRatio: 1 / 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
      ),
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(news[index].title,
                      style:TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(news[index].content)
                ],
              ),
            );
          }),
    );
  }
}