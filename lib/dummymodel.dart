class DummyModel {
  String? image;
  String? firstname;
  String? lastname;
  int? id;
  String? emailId;

  DummyModel(
      {this.emailId, this.id, this.image, this.firstname, this.lastname});

  static DummyModel fromjson(Map<String, dynamic> json) {
    return DummyModel(
        id: json["id"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        image: json["avatar"],
        emailId: json["email"]);
  }
}

class Data {
  List<DummyModel>? data;

  Data({this.data});

  static Data fromjson(Map<String, dynamic> json) {
    print(json["data"]);
    return Data(
        data: json["data"].map<DummyModel>((i) {
      return DummyModel.fromjson(i);
    }).toList());
  }
}
