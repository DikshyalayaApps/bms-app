class LoginParams {
  String? clientId;
  String? clientSecret;
  String? username;
  String? password;

  LoginParams({
    this.clientId,
    this.clientSecret,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJsonLogin() {
    final map = <String, dynamic>{};
    map["client_id"] = clientId;
    map["client_secret"] = clientSecret;
    map["username"] = username;
    map["password"] = password;
    return map;
  }
}

class SocialLoginParams {
  String? accessToken;
  String? type;
  String? firstName;
  String? lastName;
  String? userIdentifier;
  String? email;

  SocialLoginParams({
    this.accessToken,
    this.userIdentifier,
    this.firstName,
    this.lastName,
    this.email,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["loginType"] = type ?? "facebook";
    if (type != 'apple') map["accessToken"] = accessToken;
    if (type == 'apple') {
      if (email != null) map["email"] = email;
      if (userIdentifier != null) map["userIdentifier"] = userIdentifier;
      if (lastName != null) map["lastName"] = lastName;
      if (firstName != null) map["firstName"] = firstName;
    }
    return map;
  }
}
