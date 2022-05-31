import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final193238/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;
  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> init() async {
    // Just for testing. Allows the splash screen to be shown a few seconds
    //await Future.delayed(Duration(seconds: 3));
    _authSubscription = _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  void _authStateChanged(AuthUser? user) => user == null ? emit(AuthSignedOut()) : emit(AuthSignedIn(user));

  Future<void> createUserWithEmailAndPassword(String email, String password) =>
      _signIn(_authRepository.createUserWithEmailAndPassword(email, password));

  Future<void> signInWithEmailAndPassword(String email, String password) =>
      _signIn(_authRepository.signInWithEmailAndPassword(email, password));

  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      emit(AuthSigningIn());
      final user = await auxUser;
      if (user == null) {
        emit(AuthError("Unknown error, try again later"));
      } else {
        emit(AuthSignedIn(user));
      }
    } catch (e) {
      print('Catched error $e');
      emit(AuthError("Error ${e.toString()}"));
    }
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    // TODO: implement close
    return super.close();
  }


}

abstract class AuthState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState{}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}


class AuthSigningIn extends AuthState {}

class AuthSignedOut extends AuthState {}


class AuthSignedIn extends AuthState {
  final AuthUser user;

  AuthSignedIn(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];

}