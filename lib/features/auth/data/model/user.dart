class SocialUser {
  final String userId;
  final String name;
  final String? email;
  final String? accessToken;
  final String? profilePicture;

  SocialUser({
    required this.userId,
    required this.name,
    required this.accessToken,
    required this.email,
    required this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["userId"] = userId;
    map["name"] = name;
    map["accessToken"] = accessToken;
    map["email"] = email;
    map["profilePicture"] = profilePicture;
    return map;
  }
}
