import 'dart:js';

class User {
  String? firstName;
  String? lastName;

  User({this.firstName, this.lastName});

  static User fromjson(json) {
    return User(firstName: json["first_name"], lastName: json["last_name"]);
  }
}

class MessageInfo {
  String? message;
  String? time;
  MessageInfo({this.message, this.time});
  static MessageInfo fromjson(json) {
    return MessageInfo(message: json["message"], time: json["time"]);
  }
}

class Users {
  String? name;
  String? image;

  int? id;
  Users({this.id, this.name, this.image});
  static Users fromjson(json) {
    return Users(
        id: json["id"], name: json["name"], image: json["profile_image"]);
  }
}

class Userseen {
  int? totalUserSeen;
  List<User>? user;
  Userseen({this.totalUserSeen, this.user});
  static Userseen fromjson(json) {
    return Userseen(
        totalUserSeen: json["total_user_seen"],
        user: json["users"].map<Users>((i) {
          return Users.fromjson(i);
        }).toList());
  }
}

class Group {
  User? user;
  MessageInfo? messageInfo;
  Userseen? userseen;
  bool? messageseen;
  Group({this.messageInfo, this.user, this.messageseen, this.userseen});
  static Group fromjson(json) {
    return Group(
        user: User.fromjson(json["user"]),
        messageInfo: MessageInfo.fromjson(json["message_info"]),
        userseen: Userseen.fromjson(json["user_seen"]),
        messageseen: json["message_seen"]);
  }
}

class UserDetail {
  String? name;
  int? id;
  MessageInfo? messageInfo;
  bool? messageSeen;
  UserDetail({this.id, this.name, this.messageInfo, this.messageSeen});
  static UserDetail fromjson(json) {
    return UserDetail(
        id: json["userId"],
        name: json["user_name"],
        messageInfo: json["message_info"],
        messageSeen: json["message_seen"]);
  }
}

class OneToone {
  List<UserDetail>? userDetail;
  OneToone({this.userDetail});
  static OneToone fromjson(json) {
    return OneToone(
        userDetail: json["one_to_one"].map<UserDetail>((i) {
      return UserDetail.fromjson(i);
    }).toList());
  }
}

class Charts {
  List<Group>? groups;
  List<OneToone>? oneToone;
  Charts({this.groups, this.oneToone});
  static Charts fromjson(json) {
    return Charts(
        groups: json["groups"].map<Group>((e) {
          return Group.fromjson(e);
        }).toList(),
        oneToone: json["one_to_one"].map<OneToone>((i) {
          return OneToone.fromjson(i);
        }).toList());
  }
}
