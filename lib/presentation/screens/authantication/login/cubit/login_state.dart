import 'package:unitedfoodindustery/core/utiles/base_state.dart';

class LoginStates{
  final Result state;
  final String userName;
  final String password;


  LoginStates({
    this.userName = '',
    this.password ='',
    this.state = const InitResult(),

  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginStates &&
        other.state == state &&
        other.userName == userName &&
        other.password == password ;
  }

  @override
  int get hashCode {
    return state.hashCode ^
    password.hashCode ^
    userName.hashCode ;
  }

  LoginStates copyWith({
    Result? state,
    String? password,
    String? userName,
  }) {
    return LoginStates(
      state: state ?? this.state,
      password: password ?? this.password,
      userName: userName ?? this.userName,

    );
  }


  @override
  String toString() =>
      'RecommendStates(state: $state,password:$password,userName: $userName )';
}