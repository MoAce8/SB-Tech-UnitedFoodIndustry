import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitedfoodindustery/core/common/data/local_preference.dart';
import 'package:unitedfoodindustery/core/common/entities/app_user.dart';
import 'package:unitedfoodindustery/core/router/router.dart';

import 'package:unitedfoodindustery/core/utiles/base_state.dart';
import 'package:unitedfoodindustery/core/utiles/di.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/data/login_model.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/data/login_repo.dart';
import 'package:unitedfoodindustery/presentation/screens/authantication/login/cubit/login_state.dart';
import 'package:unitedfoodindustery/presentation/screens/tabs/tabs_screen.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());
  static LoginCubit get(contex) => BlocProvider.of(contex);
  final _localPreference = locator<LocalPreferences>();
  final repo = LoginRepo();
  login({required String userName,required String password,}) async {
    emit(state.copyWith(state: const LoadingResult()));
    final response = await repo.login(
        {
          "userName": userName,
          "password": password,
        }
    );
    response.fold(
          (left) => emit(state.copyWith(state: ErrorResult(left))),
          (right) => _handleAuthenticationSuccess(right),
    );
  }
  _handleAuthenticationSuccess(LoginResponse response) {
    if (response.result.emailConfirmed) {
      _localPreference.updateAppUser(AppUser.fromLoginResponse(response));
      MagicRouter.navigateAndPopUntilFirstPage(const TabsScreen());
      emit(state.copyWith(state: const SuccessResult()));
    }
  }
  setPassword(String? password) {
    emit(state.copyWith(password: password ));
  }
  setEmail(String? userName) {
    emit(state.copyWith(userName: userName ));
  }
}