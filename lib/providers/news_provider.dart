import 'dart:convert';

import '../models/news.dart';
import 'package:http/http.dart' as http;

class NewsProviders{
  Uri uri = Uri.parse("https://newsapi.org/v2/top-headlines?country=kr&apiKey=d198544121114b95a2377765e7f80ea1");

  Future<List<News>> getNews() async {
    List<News> news = [];

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      news = jsonDecode(response.body)['articles'].map<News>( (article) {
        return News.fromMap(article);
      }).toList();
    }

    return news;
  }


}