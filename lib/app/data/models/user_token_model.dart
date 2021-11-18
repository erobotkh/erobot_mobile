class UserToken {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;
  int? createdAt;

  UserToken({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.createdAt,
  });

  UserToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['created_at'] = createdAt;
    return data;
  }
}
