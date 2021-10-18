import 'dart:convert';

class Article {
  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.author,
  });

  int? id;
  String? title;
  String? content;
  String? excerpt;
  String? author;

  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      excerpt: json['excerpt']['rendered'],
      author: json['author'].toString(),
    );
  }
}

List<Article> artikel = [];
