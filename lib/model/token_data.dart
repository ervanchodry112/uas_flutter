class TokenData {
  String? type = "bearer";
  String token;

  TokenData({
    this.type,
    required this.token,
  });
}
