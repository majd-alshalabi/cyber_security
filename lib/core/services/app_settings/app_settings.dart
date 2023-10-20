import 'dart:async';

import 'package:cyber_security/core/model/message_model.dart';
import 'package:cyber_security/feature/chat_screen/service/firebase_service.dart';
import 'package:uuid/uuid.dart';

class AppSettings {
  static final AppSettings _instance = AppSettings._internal();

  factory AppSettings() {
    return _instance;
  }
  AppSettings._internal() {
    myId = const Uuid().v4();
  }

  StreamController<MessageUpdateModel> messageUpdateStream =
      StreamController<MessageUpdateModel>.broadcast();

  final FirebaseService firebaseService = FirebaseService();
  late String myId;
}

abstract class MessageUpdateModel {}

class AddMessagesToStream extends MessageUpdateModel {
  final List<MessageModel> messages;

  AddMessagesToStream({required this.messages});
}
