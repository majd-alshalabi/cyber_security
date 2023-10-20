import 'package:encrypt/encrypt.dart' as encrypt;

class AesEncryption {
  late encrypt.Key key;
  late encrypt.Encrypter encrypter;
  AesEncryption() {
    key = encrypt.Key.fromUtf8('this is encryption key 32 chars.');
    encrypter = encrypt.Encrypter(encrypt.AES(key));
  }
  encrypt.IV generateIV() {
    final encrypt.IV iv = encrypt.IV.fromLength(16);
    return iv;
  }

  EncryptedMessageModel encryptText(String text) {
    encrypt.IV iv = generateIV();
    final encrypted = encrypter.encrypt(text, iv: iv);
    return EncryptedMessageModel(text: encrypted.base64, iv: iv.base64);
  }

  String decryptText(String text, String iv) {
    final decrypted = encrypter.decrypt(encrypt.Encrypted.from64(text),
        iv: encrypt.IV.fromBase64(iv));
    return decrypted;
  }
}

class EncryptedMessageModel {
  final String text;
  final String iv;

  EncryptedMessageModel({required this.text, required this.iv});
}
