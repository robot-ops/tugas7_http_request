class Search {
  String url;
  String title;
  int id;
  Search({required this.url, required this.id, required this.title});

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      url: json["url"],
      id: json["id"],
      title: json["title"],
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "url": url,
      "id": id,
      "title": title,
    };
  }
}
