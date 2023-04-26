class UserDetail {
  String? image;
  String? name;
  String? lastName;
  String? time;
  int? count;

  UserDetail({this.image, this.count, this.lastName, this.name, this.time});

 
  static UserDetail fromjson(Map<String, dynamic> json) {
    return UserDetail(
        image: json["profile_image"],
        name: json["user_name"],
        lastName: json["last_message"],
        time: json["date"],
        count: json["message_count"]);
  }
}

class ChartModel {
  List<UserDetail>? charts;
  ChartModel({this.charts});
 static ChartModel fromjson(Map<String, dynamic> json) {
    return ChartModel(
      charts: json['charts'].map<UserDetail>((item){
        
        return UserDetail.fromjson(item);
      }).toList()
    );
  }
}
