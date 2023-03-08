import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_222/screen/login/login_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool seePasword = true;
  void seePassword() {
    seePasword = !seePasword;
    suffix =
        seePasword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordState());
  }

  void userLogin({required emailAddress, required password}) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSuccessState(FirebaseAuth.instance.currentUser!.uid));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(LoginErrorState(e.toString()));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(LoginErrorState(e.code));
      }
    }
  }
}
