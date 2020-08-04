class City {
  final String title;
  final int id;

  City({this.title, this.id});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(id: json['woeid'], title: json['title']);
  }
}
