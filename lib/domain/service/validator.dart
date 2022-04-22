class Validator {
  static bool validateEmail(String value) {
    if (value.isEmpty) return false;

    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool validatePassword(String value) {
    if (value.isEmpty) return false;

    if (value.length < 5) {
      return false;
    }
    return true;
  }
}
