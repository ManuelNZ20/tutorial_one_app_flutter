class FunctionStringTitle {
  static String firstTextTitle(String string) {
    if (string.isEmpty) return '';
    final stringFunctions = string.split(' ');
    if (stringFunctions.length == 1) return string;
    return stringFunctions[0];
  }

  static int subStringTitle(String string) {
    if (string.isEmpty) return 0;
    return string.length;
  }
}
