import 'dart:convert';

import 'package:ecommerec_app/API/model/Request/LoginRequest.dart';
import 'package:ecommerec_app/API/model/Request/RegisterRequest.dart';
import 'package:ecommerec_app/API/model/Response/LoginResponse.dart';
import 'package:ecommerec_app/API/model/Response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

//
class ApiManger {
  static Future<RegisterResponse> register(String name, String email,
      String password, String rePassword, String phone) async {
    var requestBody = RegisterRequest(
      name: name,
      phone: phone,
      email: email,
      password: password,
      repassword: rePassword,
    );
    var url = Uri.https(ApiConstants.base_Url, ApiConstants.registerApi);
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login(
    String email,
    String password,
  ) async {
    var requestBody = LoginRequest(
      email: email,
      password: password,
    );
    var url = Uri.https(ApiConstants.base_Url, ApiConstants.login);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}

class ApiConstants {
  static const base_Url = 'route-ecommerce.vercel.app';
  static const registerApi = 'api/v1/auth/signup';
  static const login = 'api/v1/auth/signin';
}
