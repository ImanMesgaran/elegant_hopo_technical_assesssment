/// Utility class containing common validation methods.
class Validators {
  const Validators._();

  /// Validates if the given string is a valid email address.
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Validates if the given string is a valid phone number.
  static bool isValidPhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return false;

    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    return phoneRegex.hasMatch(phoneNumber.replaceAll(' ', ''));
  }

  /// Validates if the given string is a valid password.
  /// Password must be at least 8 characters long and contain at least one
  /// uppercase letter, one lowercase letter, and one number.
  static bool isValidPassword(String password) {
    if (password.length < 8) return false;

    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasNumber = password.contains(RegExp(r'[0-9]'));

    return hasUppercase && hasLowercase && hasNumber;
  }

  /// Validates if the given string is not empty.
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// Validates if the given string has a minimum length.
  static bool hasMinLength(String value, int minLength) {
    return value.length >= minLength;
  }

  /// Validates if the given string has a maximum length.
  static bool hasMaxLength(String value, int maxLength) {
    return value.length <= maxLength;
  }

  /// Validates if the given string is a valid URL.
  static bool isValidUrl(String url) {
    if (url.isEmpty) return false;

    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  /// Validates if the given string contains only alphanumeric characters.
  static bool isAlphanumeric(String value) {
    if (value.isEmpty) return false;

    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumericRegex.hasMatch(value);
  }

  /// Validates if the given string contains only letters.
  static bool isLettersOnly(String value) {
    if (value.isEmpty) return false;

    final lettersRegex = RegExp(r'^[a-zA-Z]+$');
    return lettersRegex.hasMatch(value);
  }

  /// Validates if the given string contains only numbers.
  static bool isNumbersOnly(String value) {
    if (value.isEmpty) return false;

    final numbersRegex = RegExp(r'^[0-9]+$');
    return numbersRegex.hasMatch(value);
  }
}
