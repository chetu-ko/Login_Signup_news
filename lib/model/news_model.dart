class Data {
  int id;
  String title;
  String summary;
  String link;
  String published;
  String image;

  Data(
      {this.id,
      this.title,
      this.summary,
      this.link,
      this.published,
      this.image});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      link: json['link'],
      published: json['published'],
      image: json['image'],
    );
  }
}
