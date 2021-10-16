import 'dart:convert';

class Article {
  String? title;
  String? content;
  String? excerpt;
  String? author;
  int? id;

  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.content,
    required this.excerpt,
  });

  factory Article.fromJSON(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      author: json['author'].toString(),
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      excerpt: json['excerpt']['rendered'],
    );
  }
}
