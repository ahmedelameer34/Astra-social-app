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

// get posts states
class HomeGetPostsLoadingState extends HomeStates {}

class HomeGetPostsSuccessState extends HomeStates {}

class HomeGetPostsErrorState extends HomeStates {
  final String error;
  HomeGetPostsErrorState(this.error);
}

//like post states
class HomeLikePostSuccessState extends HomeStates {}

class HomeLikePostErrorState extends HomeStates {
  final String error;
  HomeLikePostErrorState(this.error);
}

//GetLikesNumber
class LodingGetLikesNumberState extends HomeStates {}

class GetLikesNumberSuccessState extends HomeStates {}

class GetLikesErrorState extends HomeStates {}

class LodingGetCommentsState extends HomeStates {}

class GetCommentsSuccessState extends HomeStates {}

class GetCommentsErrorState extends HomeStates {}

class HomeAddCommentSuccessState extends HomeStates {}

class HomeAddCommentErrorState extends HomeStates {
  final String error;
  HomeAddCommentErrorState(this.error);
}

//get all users data
class GetAllUsresLoadingState extends HomeStates {}

class GetAllUsresSuccessState extends HomeStates {}

class GetAllUsresErrorState extends HomeStates {
  final String error;
  GetAllUsresErrorState(this.error);
}
