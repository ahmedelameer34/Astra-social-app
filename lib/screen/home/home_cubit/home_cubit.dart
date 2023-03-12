import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_application_222/models/post_model.dart';

import 'package:flutter_application_222/screen/chats/chats.dart';
import 'package:flutter_application_222/screen/feeds/feeds.dart';
import 'package:flutter_application_222/screen/home/home_cubit/states.dart';
import 'package:flutter_application_222/screen/settings/settings.dart';
import 'package:flutter_application_222/screen/users/users.dart';
import 'package:flutter_application_222/shared/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/user_model.dart';
import '../../profile/profile_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  UserModel model = UserModel.ec();
  //getUserData
  void getUserData() {
    emit(HomeGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      model = UserModel.fromJson(value.data()!);
      emit(HomeGetUserSuccessState());
    }).catchError((error) {
      emit(HomeGetUserErrorState(error.toString()));
    });
  }

//changeBottomNav
  int currentIndex = 0;
  List<String> titles = [
    'News Feed',
    'Chats',
    'My Profile',
    'Users',
    'Settings'
  ];
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const ProfileScreen(),
    const UsersScreen(),
    const SettingsScreen()
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  final ImagePicker picker = ImagePicker();

  //updateUserInfo

  void updateUserInfo(
      {required name, required bio, required phone, image, cover}) {
    emit(UpdatePofileLoadingState());
    UserModel user = UserModel(
        name: name,
        phone: phone,
        bio: bio,
        profileCover: cover ?? model.profileCover,
        profileImage: image ?? model.profileImage,
        email: model.email,
        uId: model.uId,
        isEmailVerified: model.isEmailVerified);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(user.toMap())
        .then((value) {
      getUserData();

      emit(UpdatePofileSucceseState());
    }).catchError((error) {
      emit(UpdatePofileErrorState());
    });
  }

  void uploadProfileImage(
      {required String name, required String bio, required String phone}) {
    emit(UploadPofileImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserInfo(name: name, bio: bio, phone: phone, image: value);
        emit(UploadPofileImageSucceseState());
      }).catchError((error) {
        emit(UploadPofileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadPofileImageErrorState());
    });
  }

  File? profileImage;
  Future setProfileImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    try {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        emit(ChangeProfileImageSucceseState());
      }
    } catch (e) {
      emit(ChangeProfileImageErrorState());
    }
  }

  void uploadcoverImage(
      {required String name, required String bio, required String phone}) {
    emit(UploadCoverImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserInfo(name: name, bio: bio, phone: phone, cover: value);
        emit(UploadCoverImageSucceseState());
      }).catchError((error) {
        emit(UploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(UploadCoverImageErrorState());
    });
  }

  File? coverImage;
  Future setCoverImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    try {
      if (pickedFile != null) {
        coverImage = File(pickedFile.path);
        emit(ChangeCoverImageSucceseState());
      }
    } catch (e) {
      emit(ChangeCoverImageErrorState());
    }
  }

// createpost
  void removePostImage() {
    postImage = null;
    emit(RemovePostImageState());
  }

  Future setPostImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    try {
      if (pickedFile != null) {
        postImage = File(pickedFile.path);
        emit(GetPostImageSucceseState());
      }
    } catch (e) {
      emit(GetPostImageErrorState());
    }
  }

  File? postImage;
  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(PostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(dateTime: dateTime, postText: text, postImage: value);
      }).catchError((error) {
        emit(PostErrorState());
      });
    }).catchError((error) {
      emit(PostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String postText,
    String? postImage,
  }) {
    emit(PostLoadingState());
    PostModel user = PostModel(
      name: model.name,
      profileImage: model.profileImage,
      uId: model.uId,
      postImage: postImage ?? '',
      postText: postText,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(user.toMap())
        .then((value) {
      emit(PostSucceseState());
    }).catchError((error) {
      emit(PostErrorState());
    });
  }

//getPosts

  List<PostModel> posts = [];
//  List<int> likesNum = [];
  // List<int> commentsNum = [];
  //List<String> postIds = [];
  void getPosts() {
    emit(HomeGetPostsLoadingState());
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        posts.add(PostModel.fromJson(element.data()));
      });
      emit(HomeGetPostsSuccessState());
    }).catchError((error) {
      emit(HomeGetPostsErrorState(error.toString()));
    });
  }
}
