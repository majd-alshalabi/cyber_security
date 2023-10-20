import 'dart:convert';

import 'package:cyber_security/core/model/message_model.dart';
import 'package:cyber_security/core/services/app_settings/app_settings.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  DatabaseReference ref = FirebaseDatabase.instance.ref("messages");

  Future<void> addData(MessageModel message) async {
    await ref.push().set(message.toJson());
  }

  Future<void> addListener() async {
    ref.onChildAdded.listen((DatabaseEvent event) {
      final MessageModel model = MessageModel.fromJson(
        jsonDecode(jsonEncode(event.snapshot.value)),
      );
      AppSettings().messageUpdateStream.add(
            AddMessagesToStream(messages: [model]),
          );
    });
  }

  List<MessageModel> convertJsonToMessage(Object? data) {
    return [];
  }
}
