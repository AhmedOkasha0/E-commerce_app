/// name : "Ahmed Abd Al-Muti"
/// email : "ahmed1@route.com"
/// phone : "01125660461"
/// password : "$2a$12$LRCzZ6RxEwxAjpRqIpTdPOySeFlbGOq4bsjfE4rnhXMYe/zYoV3US"
/// role : "user"
/// _id : "63f61d17ec9baf5b4793370a"
/// createdAt : "2023-02-22T13:48:08.003Z"
/// updatedAt : "2023-02-22T13:48:08.003Z"
/// __v : 0

class User {
  User({
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }
  String? name;
  String? email;
  String? phone;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;

    return map;
  }
}
