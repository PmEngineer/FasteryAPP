import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtilities {
  // 1. GetX SnackBar
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }

  // 2. GetX Confirm Dialog
  static Future<bool?> showConfirmDialog(String title, String middleText) async {
    return Get.defaultDialog<bool>(
      title: title,
      middleText: middleText,
      // Custom content can go here instead of middleText
      // content: Text('Are you sure?'),
      textConfirm: 'Confirm',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.deepPurple,
      onConfirm: () {
        Get.back(result: true); // Close dialog and return true
      },
      onCancel: () {
        Get.back(result: false); // Close dialog and return false
      },
    );
  }
}