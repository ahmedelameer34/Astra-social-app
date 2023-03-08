class UserModel {
  String email = '';
  String name = '';
  String uId = '';
  String phone = '';
  bool? isEmailVerified;
  String profileImage =
      'https://www.clipartkey.com/mpngs/m/152-1520367_user-profile-default-image-png-clipart-png-download.png';
  String profileCover =
      'https://3.bp.blogspot.com/-1Dv0xzZ0wco/UfPKMftBejI/AAAAAAAABfQ/rOrHBIoX2Fo/s1600/Epic-best-covers.jpg';
  String bio = '';
  UserModel.ec();

  UserModel(
      {required this.name,
      required this.email,
      required this.uId,
      required this.phone,
      required this.isEmailVerified,
      required this.profileImage,
      required this.profileCover,
      required this.bio});
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
    phone = json['phone'];
    isEmailVerified = json['isEmailVerified'];
    profileImage = json['profileImage'];
    profileCover = json['profileCover'];
    bio = json['bio'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isEmailVeriified': isEmailVerified,
      'profileImage': profileImage,
      'profileCover': profileCover,
      'bio': bio
    };
  }
}
