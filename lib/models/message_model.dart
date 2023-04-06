class MessageModel {
  String senderId = '';
  String receiverId = '';
  String dateTime = '';
  String messageText = '';

  MessageModel.ec();
  MessageModel({
    required this.dateTime,
    required this.senderId,
    required this.receiverId,
    required this.messageText,
  });
  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];

    messageText = json['messageText'];
    dateTime = json['dateTime'];
  }
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'messageText': messageText,
      'dateTime': dateTime
    };
  }
}
