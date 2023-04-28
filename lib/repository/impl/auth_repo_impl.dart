import 'package:ecommerec_app/repository/auth/auth_repo_contract.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<String?> login(String email, String password) async {
    var response = await authRemoteDataSource.login(email, password);
    return response.token;
  }

  @override
  Future<String?> register(String name, String password, String email,
      String rePassword, String phone) async {
    var respone = await authRemoteDataSource.register(
        name, password, email, rePassword, phone);
    return respone.token;
  }
}
