abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeGetUserLoadingState extends HomeStates {}

class HomeGetUserSuccessState extends HomeStates {}

class HomeGetUserErrorState extends HomeStates {
  final String error;
  HomeGetUserErrorState(this.error);
}

class ChangeBottomNavState extends HomeStates {}

class ChangeProfileImageSucceseState extends HomeStates {}

class ChangeProfileImageErrorState extends HomeStates {}

class ChangeCoverImageSucceseState extends HomeStates {}

class ChangeCoverImageErrorState extends HomeStates {}

class UploadCoverImageSucceseState extends HomeStates {}

class UploadCoverImageErrorState extends HomeStates {}

class UploadCoverImageLoadingState extends HomeStates {}

class UpdatePofileSucceseState extends HomeStates {}

class UploadPofileImageSucceseState extends HomeStates {}

class UploadPofileImageLoadingState extends HomeStates {}

class UploadPofileImageErrorState extends HomeStates {}

class UpdatePofileErrorState extends HomeStates {}

class UpdatePofileLoadingState extends HomeStates {}

class PostSucceseState extends HomeStates {}

class PostErrorState extends HomeStates {}

class PostLoadingState extends HomeStates {}

class GetPostImageSucceseState extends HomeStates {}

class GetPostImageErrorState extends HomeStates {}

class RemovePostImageState extends HomeStates {}
