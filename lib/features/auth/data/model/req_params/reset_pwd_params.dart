class ResetPwdParams {
   String? phone;
   String? otp;
   String? password;
   String? confirmPassword;

  ResetPwdParams({this.phone, this.otp, this.password,this.confirmPassword});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["otpKey"] = otp;
    map["password"] = password;
    map["confirmPassword"] = confirmPassword;
    return map;
  }
}
