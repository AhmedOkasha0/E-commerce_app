import 'package:ecommerec_app/API/model/Response/ServerError.dart';

import 'Data.dart';

/// data : {"name":"Ahmed Abd Al-Muti","email":"ahmed1@route.com","phone":"01125660461","password":"$2a$12$LRCzZ6RxEwxAjpRqIpTdPOySeFlbGOq4bsjfE4rnhXMYe/zYoV3US","role":"user","_id":"63f61d17ec9baf5b4793370a","createdAt":"2023-02-22T13:48:08.003Z","updatedAt":"2023-02-22T13:48:08.003Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZjYxZDE3ZWM5YmFmNWI0NzkzMzcwYSIsImlhdCI6MTY3NzA3MzY4OCwiZXhwIjoxNjg0ODQ5Njg4fQ._MCiZfDuhX50EoUXZl6CjXeknOoH2cqd56P0AOA7u0M"

class RegisterResponse {
  RegisterResponse({
    this.data,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    data = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerError.fromJson(v));
      });
    }
  }
  User? data;
  String? token;
  List<ServerError>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }
}
