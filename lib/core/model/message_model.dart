class MessageModel {
  String? username;
  String? message;
  int? createdAt;
  String? id;
  String? iv;
  String? decryptedMessage;

  MessageModel({this.username, this.message, this.createdAt, this.id, this.iv});

  MessageModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    message = json['message'];
    iv = json['iv'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['iv'] = iv;
    data['id'] = id;
    return data;
  }
}
