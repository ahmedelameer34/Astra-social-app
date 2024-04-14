import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_222/screen/register/register_cubit/states.dart';
import 'package:flutter_application_222/shared/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_222/models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool seePasword = true;
  void seePassword() {
    seePasword = !seePasword;
    suffix =
        seePasword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordState());
  }

  UserModel user = UserModel.ec();
  Future<void> userRegister(
      {required String name,
      required String password,
      required String emailAddress,
      required String phone}) async {
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      uId = FirebaseAuth.instance.currentUser!.uid;
      userCreate(
          name: name,
          uId: FirebaseAuth.instance.currentUser!.uid,
          phone: phone,
          email: emailAddress);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(RegisterErrorState(e.code));
      }
    } catch (e) {
      print(e);
      emit(RegisterErrorState(e.toString()));
    }
  }

  Future<void> userCreate({
    required String name,
    required String email,
    required String uId,
    required String phone,
  }) async {
    user = UserModel(
        name: name,
        uId: uId,
        email: email,
        phone: phone,
        bio: 'bio',
        profileCover:
            'https://3.bp.blogspot.com/-1Dv0xzZ0wco/UfPKMftBejI/AAAAAAAABfQ/rOrHBIoX2Fo/s1600/Epic-best-covers.jpg',
        profileImage:
            'https://www.clipartkey.com/mpngs/m/152-1520367_user-profile-default-image-png-clipart-png-download.png',
        isEmailVerified: false);
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(user.toMap());
      emit(CreateUserSuccessState());
    } on Exception catch (e) {
      print(e.toString());
      emit(CreateUserErrorState(e.toString()));
    }
  }
}
