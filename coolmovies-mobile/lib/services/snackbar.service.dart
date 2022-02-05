import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarService extends GetxService {
  void error(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      duration: Duration(seconds: 5),
      isDismissible: true,
      shouldIconPulse: true,
      barBlur: 20,
      backgroundColor: Colors.deepOrange,
      colorText: Colors.white,
    );
  }

  void success(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: Icon(
        Icons.verified,
        color: Colors.white,
      ),
      duration: Duration(seconds: 5),
      isDismissible: true,
      shouldIconPulse: true,
      barBlur: 20,
      backgroundColor: Colors.green[300],
      colorText: Colors.white,
    );
  }
}
