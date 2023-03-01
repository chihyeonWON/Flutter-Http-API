class News{
  late String author; // 출판사
  late String title; // 주제
  late String content; // 내용
  late String url; // url
  late String publishedAt; // 일자

  News({
    required this.author,
    required this.title,
    required this.content,
    required this.url,
    required this.publishedAt
  });

  News.fromMap(Map<String, dynamic>? map) {
    author = map?['author'] ?? '';
    title = map?['title'] ?? '';
    content = map?['description'] ?? '';
    url = map?['url'] ?? '';
    publishedAt = map?['publishedAt'] ?? '';
  }
}