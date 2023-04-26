import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Mystatus {
  String? image;
  String? name;
  String? time;

  Mystatus({this.image, this.name, this.time});
  static fromjson(Map<String, dynamic> json) {
    return Mystatus(
        image: json["profile_image"],
        name: json["my_name"],
        time: json["date"]);
  }
}

class UserName {
  String? firstname;
  String? lastname;

  UserName({this.firstname, this.lastname});
  static UserName fromjson(Map<String, dynamic> json) {
    return UserName(firstname: json["first_name"], lastname: json["last_name"]);
  }
}

class Status {
  String? image;
  UserName? userName;
  String? time;
  Status({this.image, this.userName,this.time});
  static Status fromjson(Map<String, dynamic> json) {
    return Status(
        image: json["profile_image"],
        userName: UserName.fromjson(json["user"]),
        time: json["date"]);
  }
}

class RecentUpdated {
  List<Status>? recentupdated;
  RecentUpdated({this.recentupdated});
  static RecentUpdated fromjson(Map<String, dynamic> json) {
    
    return RecentUpdated(
        recentupdated: json["status"].map<Status>((i) {
      return Status.fromjson(i);
    }).toList());
  }
}

class AllStatus {
  Mystatus? mystatus;
  RecentUpdated? recentUpdated;
  List<Status>? vivedStatus;

  AllStatus({this.mystatus, this.recentUpdated, this.vivedStatus});

  static fromjson(Map<String, dynamic> json) {
    return AllStatus(
        mystatus: Mystatus.fromjson(json["myStatus"]),
        recentUpdated: RecentUpdated.fromjson(json["recent_updated"]),
        vivedStatus: json["view_update"].map<Status>((e) {
          return Status.fromjson(e);
        }).toList());
  }
}
