class Model {
  String? userId;
  String? name;
  String? birthday;

  Model({this.userId, this.name, this.birthday});

  Model.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    return data;
  }
}

class ModelList {
  final List<Model>? datas;
  ModelList({this.datas});
  factory ModelList.fromJson(List<dynamic> json) {
    List<Model> datas = <Model>[];
    datas = json.map((i) => Model.fromJson(i)).toList();

    return ModelList(
      datas: datas,
    );
  }
}
