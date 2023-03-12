class RegistrationParams {
  String? clientId;
  String? clientSecret;
  String? username;
  String? password;
  String? firstName;
  String? fullName;
  String? phone;
  String? device;
  String? email;
  String? otpKey;
  String? confirmPassword;
  String? lastName;



  RegistrationParams({
    this.clientId,
    this.clientSecret,
    this.username,
    // this.firstName,
    this.phone,
    this.device,
    this.otpKey,
    this.fullName,
    this.password,
    this.email,
    this.confirmPassword,
    // this.lastName
  });


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["firstName"] = fullName?.split(" ")[0];
    map["lastName"] = fullName?.split(" ")[1];
    map["otpKey"] = otpKey;
    map["email"] = email;
    map["username"] = username;
    map["phone"] = phone;
    map["password"] = password;
    return map;
  }

}