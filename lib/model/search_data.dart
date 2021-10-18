class SearchData {
  String? url;
  String? title;
  int? id;
  SearchData({required this.url, required this.id, required this.title});

  factory SearchData.fromJson(Map<String, dynamic> json) {
    return SearchData(
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
