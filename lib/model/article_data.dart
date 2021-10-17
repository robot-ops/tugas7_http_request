import 'dart:convert';

Artikelmodel artikelmodelFromJson(String str) {
  return Artikelmodel.fromJson(json.decode(str));
}

String artikelmodelToJson(Artikelmodel data) {
  return json.encode(data.toJson());
}

class Artikelmodel {
  Artikelmodel({
    required this.infoartikel,
  });

  List<Article> infoartikel;

  factory Artikelmodel.fromJson(Map<String, dynamic> json) {
    return Artikelmodel(
        infoartikel: List<Article>.from(
            json["infoartikel"].map((x) => Article.fromJSON(x))));
  }

  Map<String, dynamic> toJson() {
    return {
      "Infoartikel": List<dynamic>.from(infoartikel.map((x) => x.toJson())),
    };
  }
}

class Article {
  String title;
  String content;
  String excerpt;
  String author;
  int id;

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
  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Author": author,
      "Title": title,
      "Content": content,
      "Exceprt": excerpt
    };
  }
}

// List<Article> post = [];
