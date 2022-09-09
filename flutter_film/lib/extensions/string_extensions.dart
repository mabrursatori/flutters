part of 'extensions.dart';

extension StringExtensions on String {
  bool isDigit(int index) =>
      this.codeUnitAt(index) >= 48 && this.codeUnitAt(index) <= 57;
}
