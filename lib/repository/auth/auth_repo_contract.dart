import 'package:ecommerec_app/API/model/Response/LoginResponse.dart';
import 'package:ecommerec_app/API/model/Response/RegisterResponse.dart';

abstract class AuthRepository {
  // this function return token incase of successful login
  // and return null incase of failed login
  Future<String?> login(String email, String password);

  Future<String?> register(String name, String password, String email,
      String rePassword, String phone);
}

// this class to call api
abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(String email, String password);
  
  Future<RegisterResponse> register(String name, String password, String email,
      String rePassword, String phone);
}
