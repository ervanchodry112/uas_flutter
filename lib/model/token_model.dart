import 'package:proyek_uas/model/token_data.dart';

class TokenModel {
  bool status;
  String message;
  TokenData data;

  TokenModel({
    required this.status,
    required this.message,
    required this.data,
  });
}
