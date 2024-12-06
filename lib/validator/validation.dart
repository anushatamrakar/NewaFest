class SignUpValidation {
  static String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Full name is required.';
    }
    if (value.length < 5) {
      return 'Full name must be at least 5 characters long.';
    }
    return null;
  }

  static String? validateEmailAddress(String value) {
    if (value.isEmpty) {
      return 'Email address is required.';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Phone number is required.';
    }
    if (!RegExp(r'^\d{10}\$').hasMatch(value)) {
      return 'Phone number must be exactly 10 digits.';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  static String? validateTermsAgreement(bool isChecked) {
    if (!isChecked) {
      return 'You must agree to the terms and privacy policy.';
    }
    return null;
  }
}
