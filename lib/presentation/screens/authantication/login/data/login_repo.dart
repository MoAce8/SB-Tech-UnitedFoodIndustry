import 'package:either_dart/either.dart';
import 'package:unitedfoodindustery/core/constants/urls.dart';
import 'package:unitedfoodindustery/core/utiles/network_client.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/data/login_model.dart';

class LoginRepo{
  Future<Either<String, LoginResponse>> login(Map data) async {
    const url = Urls.LOGIN;
    final uri = Uri.parse(url);
    final result = await NetworkClient.postRequest(uri, data: data);
    return result.fold(
          (left) => Left(left.message),
          (right) {
            print("q113");
        final loginResponse = LoginResponse.fromMap(right);
        if (loginResponse.result.emailConfirmed) {
          return Right(LoginResponse.fromMap(right));
        } else {
          return const Left('you can\'t log in with this account');
        }},
    );
  }
}