import 'package:cyber_security/core/constants/styles.dart';
import 'package:cyber_security/core/model/message_model.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';

class MessageDetailsScreen extends StatelessWidget {
  const MessageDetailsScreen(
      {super.key, required this.model, required this.messagesKey});
  final MessageModel model;
  final encrypt.Key messagesKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "message details",
          style: StylesText.newDefaultTextStyle.copyWith(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "encrypted message : ${model.message}",
              style: StylesText.newDefaultTextStyle
                  .copyWith(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              "decrypted message : ${model.decryptedMessage}",
              style: StylesText.newDefaultTextStyle
                  .copyWith(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              "key : ${messagesKey.base64}",
              style: StylesText.newDefaultTextStyle
                  .copyWith(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              "iv : ${model.iv}",
              style: StylesText.newDefaultTextStyle
                  .copyWith(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
