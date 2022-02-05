class Directors {
  int? age;
  String? id;
  String? name;

  Directors({this.age, this.id, this.name});

  Directors.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
