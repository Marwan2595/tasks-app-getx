import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showSnackBar(String title, String message,
      {Color bgColor = Colors.red, Color txtColor = Colors.white}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: bgColor,
      snackPosition: SnackPosition.BOTTOM,
      colorText: txtColor,
    );
  }
}
