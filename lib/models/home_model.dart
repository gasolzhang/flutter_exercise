class MovieModel {
  int total;
  int index;
  List<MovieItemModel> items = [];

  MovieModel.fromMap(Map<String, dynamic> map) {
    //手动解析参数？？？
    this.total = map['total'];
    this.index = map['index'];
    final data = map['datas'];
    for (final m in data) {
      items.add(MovieItemModel.fromMap(m));
    }
  }
}

class MovieItemModel {
  int id;
  String name;
  String image;
  double score;
  List<String> category;
  String intro;
  String duration;
  List<String> roles;

  MovieItemModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.image = map['image'];
    this.score = map['score'];
    this.category = map['category'];
    this.intro = map['intro'];
    this.duration = map['duration'];
    this.roles = List<String>.from(map['roles']);
  }
}
