import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_store/utils/constants/colors.dart';

class THelperFunctions {
  /// Get color from string name
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case 'green':
        return TColors.success;
      case 'red':
        return TColors.error;
      case 'blue':
        return TColors.primary;
      case 'yellow':
        return TColors.secondary;
      case 'grey':
        return TColors.grey;
      case 'black':
        return TColors.black;
      case 'white':
        return TColors.white;
      default:
        return null;
    }
  }

  /// Show Snackbar
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Show Alert Dialog
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Navigate to Screen
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Truncate text
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  /// Check Dark Mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Screen Size
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// Format Date
  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Remove duplicates from list
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Wrap widgets into rows
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];

    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );

      wrappedList.add(Row(children: rowChildren));
    }

    return wrappedList;
  }
}
