import 'package:cyber_security/core/model/message_model.dart';
import 'package:cyber_security/core/services/app_settings/app_settings.dart';
import 'package:cyber_security/feature/chat_screen/service/aes_encryption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final List<MessageModel> messages = [];
  List<types.Message> uiList = [];
  final AesEncryption aes = AesEncryption();
  ChatCubit() : super(ChatInitial()) {
    AppSettings().messageUpdateStream.stream.listen((event) {
      switch (event.runtimeType) {
        case AddMessagesToStream:
          addMessageToTheStream.call((event as AddMessagesToStream).messages);
          break;
        default:
          break;
      }
    });
  }
  void addMessageToTheStream(List<MessageModel> newMessages) {
    emit(AddMessageLoading());
    messages.addAll(newMessages.reversed);
    for (var element in newMessages) {
      element.decryptedMessage =
          decryptMessage(element.message ?? "", element.iv ?? "");
      messages.insert(0, element);
      uiList.insert(
        0,
        types.TextMessage(
          createdAt: element.createdAt,
          id: element.id ?? "",
          text: element.decryptedMessage ?? "",
          author: types.User(
              id: element.username ?? "", firstName: element.username),
        ),
      );
    }

    emit(AddMessageLoaded());
  }

  String decryptMessage(String text, String iv) {
    return aes.decryptText(text, iv);
  }
}
