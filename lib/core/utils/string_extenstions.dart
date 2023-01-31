extension SE on String {
  String getInitials() =>
      trim().split(' ').map((e) => e.trim().isEmpty ? '' : e[0]).join();

  String capitalizeInitialLetter() =>
      isNotEmpty ? "${this[0].toUpperCase()}${substring(1)}" : "";

  /// returns string with PascallCase
  String pascalCase() => split(RegExp(r'[^A-Za-z0-9]+'))
      .reduce(
          (value, element) => value + element.trim().capitalizeInitialLetter())
      .capitalizeInitialLetter();

  // returns string with camelCase
  String camelCase() => split(RegExp(r'[^A-Za-z0-9]+')).reduce(
      (value, element) => value + element.trim().capitalizeInitialLetter());

  // snack_case
  String snackCase() {
    List<String> patterns = [
      r"[ ]{1,}",
      r"(?<=[^A-Z,&])[A-Z]",
      // match capital preceded by any non-capital except ampersand
      r"(?<=[A-Z])[A-Z](?=[a-z])",
      // match capital preceded by capital and followed by lowercase letter
      r"[\+\-\*\/\=]",
      // match arithmetic operators
      r"(?<=[\+\-\*\/\=])[0-9,\(]"
      // match 0-9 or open paren preceded by arithmetic operator
    ];
    return replaceAllMapped(RegExp(patterns.join("|")),
        (match) => "_${match.group(0)?.trim() ?? ''}").toLowerCase();
  }
}
