class Movies {
  String id = '';
  String imgUrl = '';
  String title = '';

  Movies({required this.id,required this.imgUrl,required this.title});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['title'] = this.title;

    return data;
  }
}
