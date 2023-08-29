import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomWidgets {
  CustomWidgets._();
  static buildErrorSnackbar(BuildContext context, String message) {
    showTopSnackBar(
      snackBarPosition: SnackBarPosition.top,
      Overlay.of(context),
      Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: MediaQuery.of(context).size.width / 6,
          child: CustomSnackBar.success(
            backgroundColor: Colors.red.shade300,
            message:
            message,
            textStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 25,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}