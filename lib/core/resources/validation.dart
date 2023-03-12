class Validation {
  static const String fullName = 'Full Name';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String phone = 'Phone';
  static const String emailPhone = 'Email or Phone';
  static const String validationTypeIsEmpty = 'Is Empty';
  static const String validationTypeNoValidation = 'No Validation';

  final String _fullNameRegex =
      r'(^[A-Z][a-zA-Z]{2,}(?: [A-Z][a-zA-Z]*){0,2}$)';
  final String _phoneRegex = r'(^(?:[+0]9)?[0-9]{10}$)';
  final String _passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  final String _emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  handleValidation({labelText, value}) {
    switch (labelText) {
      case fullName:
        var isfullNameValid = fullNameValid(value);
        if (value.isEmpty) {
          return 'Please enter Full Name';
        } else if (!isfullNameValid) {
          return 'Not valid name';
        }

        break;

      case email:
        var isEmailValid = emailValid(value);
        if (value.isEmpty) {
          return 'Please enter email';
        } else if (!isEmailValid) {
          return 'Enter valid email';
        }

        break;

      case password:
        var isValidPassword = validPassword(value);

        if (value.isEmpty) {
          return 'Please enter password';
        } else {
          if (!isValidPassword) {
            return '*8 characters, 1 upper and 1 numeric ';
          } else {
            return null;
          }
        }

      case phone:
        var isValidPhone = phoneValid(value);

        if (value.isEmpty) {
          return 'Please enter Phone Number';
        } else {
          if (!isValidPhone) {
            return 'Not Valid Phone';
          } else {
            return null;
          }
        }

      case emailPhone:
        var isValidEmailOrPhone = phoneValid(value) || emailValid(value);

        if (value.isEmpty) {
          return 'Please enter Phone Number or Email';
        } else {
          if (!isValidEmailOrPhone) {
            return 'Not valid email id or phone number';
          } else {
            return null;
          }
        }

      case validationTypeIsEmpty:
        if (value.isEmpty) {
          return 'This Field is required';
        } else {
          return null;
        }

      case validationTypeNoValidation:
        return null;

      default:
        return null;
    }
  }

  bool emailValid(email) {
    return RegExp(_emailRegex).hasMatch(email);
  }

  bool validPassword(value) {
    return RegExp(_passwordRegex).hasMatch(value);
  }

  bool phoneValid(value) {
    return RegExp(_phoneRegex).hasMatch(value);
  }

  bool fullNameValid(value) {
    return RegExp(_fullNameRegex).hasMatch(value);
  }
}
