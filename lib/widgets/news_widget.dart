import 'package:flutter/material.dart';
import '../models/news.dart';
import '../providers/news_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("한국을 보는 창"),
      ),
      body: isLoading
          ? Center(
              child: const CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: news.length,
              itemBuilder: (context, index) {
                final Uri _url = Uri.parse(news[index].url);
                return Container(
                  height:MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.0,
                      color: Colors.grey,
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('[${news[index].author}]',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Text(news[index].title,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          news[index].content,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 16.0,
                          )
                        ),
                        Text('아래 링크를 클릭하시면 자세한 내용을 볼 수 있습니다.',style:TextStyle(fontSize:15.0, fontWeight:FontWeight.bold,)),
                        InkWell(
                            child: Text(
                              news[index].url,
                              style:TextStyle(
                                fontSize:16.0,
                              )
                            ),
                            onTap: () => launchUrl(_url)),
                        Text('일자 : ${news[index].publishedAt}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight:FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
