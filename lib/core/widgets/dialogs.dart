import 'package:bookia_store/core/constants/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showSuccessToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.green,
    ),
  );
}

showErrorToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      backgroundColor: Colors.red,
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Lottie.asset(AssetManager.loading)],
        ),
      );
    },
  );
}
