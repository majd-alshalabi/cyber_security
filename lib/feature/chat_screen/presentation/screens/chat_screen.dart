import 'package:cyber_security/core/constants/styles.dart';
import 'package:cyber_security/core/model/message_model.dart';
import 'package:cyber_security/core/services/app_settings/app_settings.dart';
import 'package:cyber_security/feature/chat_screen/presentation/bloc/chat_cubit.dart'
    as chatCubit;
import 'package:cyber_security/feature/chat_screen/service/aes_encryption.dart';
import 'package:cyber_security/feature/message_details/presentation/screens/message_details.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    AppSettings().firebaseService.addListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => chatCubit.ChatCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xffD3CBB8),
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "chat",
              style: StylesText.newDefaultTextStyle.copyWith(fontSize: 30),
            ),
          ),
          body: BlocBuilder<chatCubit.ChatCubit, chatCubit.ChatState>(
            buildWhen: (previous, current) {
              if (current is chatCubit.AddMessageLoaded) return true;
              return false;
            },
            builder: (context, state) {
              return Chat(
                messages: context.read<chatCubit.ChatCubit>().uiList,
                onMessageTap: (contexts, p1) {
                  int index =
                      context.read<chatCubit.ChatCubit>().messages.indexWhere(
                            (element) => element.id == p1.id,
                          );
                  final MessageModel message =
                      context.read<chatCubit.ChatCubit>().messages[index];
                  final encrypt.Key currentKey =
                      context.read<chatCubit.ChatCubit>().aes.key;
                  if (index != -1) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MessageDetailsScreen(
                          model: message,
                          messagesKey: currentKey,
                        );
                      },
                    ));
                  }
                },
                onSendPressed: (p0) {
                  final AesEncryption aesEncryption =
                      context.read<chatCubit.ChatCubit>().aes;
                  EncryptedMessageModel model =
                      aesEncryption.encryptText(p0.text);
                  AppSettings().firebaseService.addData(
                        MessageModel(
                          id: const Uuid().v4(),
                          message: model.text,
                          iv: model.iv,
                          username: AppSettings().myId,
                          createdAt: DateTime.now().millisecondsSinceEpoch,
                        ),
                      );
                },
                showUserAvatars: true,
                showUserNames: true,
                user: types.User(
                    id: AppSettings().myId, firstName: AppSettings().myId),
                theme: DarkChatTheme(
                  emptyChatPlaceholderTextStyle: StylesText.newDefaultTextStyle,
                  inputTextStyle: StylesText.newDefaultTextStyle,
                  dateDividerTextStyle: StylesText.newDefaultTextStyle,
                  receivedMessageBodyBoldTextStyle:
                      StylesText.newDefaultTextStyle,
                  sentMessageBodyTextStyle: StylesText.newDefaultTextStyle,
                  messageInsetsHorizontal: 15,
                  messageInsetsVertical: 15,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
