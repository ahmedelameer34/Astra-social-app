class CommentModel {
  String name = '';
  String uId = '';
  String dateTime = '';
  String commentText = '';
  String profileImage = '';

  CommentModel.ec();
  CommentModel({
    required this.dateTime,
    required this.name,
    required this.uId,
    required this.commentText,
    required this.profileImage,
  });
  CommentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];

    commentText = json['commentText'];
    dateTime = json['dateTime'];

    profileImage = json['profileImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'profileImage': profileImage,
      'commentText': commentText,
      'dateTime': dateTime
    };
  }
}
