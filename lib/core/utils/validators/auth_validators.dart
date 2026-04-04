class AuthValidators {
  AuthValidators._();

  /// Username Validation
  static String? userName(String? userName) {
    if (userName == null || userName.isEmpty) {
      return 'Please enter username properly';
    } else if (userName.contains(' ')) {
      return 'Space is not allow';
    } else if (userName.length < 5) {
      return 'Username must be at least 5 characters';
    } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(userName)) {
      return "Only numbers and latter's are allow";
    }
    return null;
  }

  /// Password Validation
  static String? password(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter password properly';
    } else if (password.contains(' ')) {
      return 'Space not allow';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Must contain at least one Uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Must contain at least one Lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Must contain at least one number';
    } else if (!RegExp(r'[!@#$&*_]').hasMatch(password)) {
      return 'Must contain at least one special character (!@#\$&*_)';
    }
    return null;
  }

  /// Full Name Validation
  static String? fullName(String? fullName) {
    final fullname = fullName?.trim();
    if (fullname == null || fullname.isEmpty) {
      return 'Please enter full name';
    }
    if (fullname.length < 6) {
      return 'Full name length must be 6';
    }
    return null;
  }

  /// User Name Validation
  static String? username(String? userName) {
    final username = userName?.trim();
    if (username == null || username.isEmpty) {
      return 'Please enter username';
    }
    return null;
  }

  /// Email Validation
  static String? email(String? email) {
    final emailId = email?.trim();
    if (emailId == null || emailId.isEmpty) {
      return 'Please enter email address';
    }
    return null;
  }

  /// Phone Number Validation
  static String? number(String? phoneNumber) {
    final number = phoneNumber?.trim();
    if (number == null || number.isEmpty) {
      return 'Please enter phone number';
    }
    return null;
  }
}
