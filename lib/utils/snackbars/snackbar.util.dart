import 'package:flutter/material.dart';

class SnackBarUtil {
  void onSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void onFailed(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
