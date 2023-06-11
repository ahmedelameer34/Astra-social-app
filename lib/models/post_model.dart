class PostModel {
  String name = '';
  String uId = '';
  String dateTime = '';
  String postText = '';
  String profileImage = '';

  String postImage = '';

  PostModel.ec();
  PostModel({
    required this.dateTime,
    required this.name,
    required this.uId,
    required this.postImage,
    required this.postText,
    required this.profileImage,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    postImage = json['postImage'];
    postText = json['postText'];
    dateTime = json['dateTime'];

    profileImage = json['profileImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'profileImage': profileImage,
      'postText': postText,
      'postImage': postImage,
      'dateTime': dateTime,
    };
  }
}
