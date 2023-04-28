import 'package:ecommerec_app/API/api_manger.dart';
import 'package:ecommerec_app/API/model/Response/LoginResponse.dart';
import 'package:ecommerec_app/API/model/Response/RegisterResponse.dart';
import 'package:ecommerec_app/repository/auth/auth_repo_contract.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  ApiManger apiManger;
  AuthRemoteDataSourceImp(this.apiManger);
  @override
  Future<LoginResponse> login(String email, String password) async {
    var response = await apiManger.login(email, password);
    return response;
  }

  @override
  Future<RegisterResponse> register(String name, String password, String email,
      String rePassword, String phone) async {
    var response =
        await apiManger.register(name, email, password, rePassword, phone);
    return response;
  }
}
