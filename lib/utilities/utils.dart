import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static void ShowFocusNode(
      FocusNode current, FocusNode next, BuildContext context) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static ToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.brown);
  }

  static FlushToastMessage(BuildContext context,String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          //forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          message: message,
          duration: Duration(seconds: 3),
          icon: Icon(Icons.error),
          flushbarPosition: FlushbarPosition.TOP,
          // backgroundGradient:const  LinearGradient(colors: [
          //   Colors.blue,
          //   Colors.red,
          //   Colors.black
          // ]),
          maxWidth: 250,
          borderRadius: BorderRadius.circular(15),
          padding: EdgeInsets.all(10),
          //reverseAnimationCurve: Curves.easeInOutBack,
        )..show(context));
  }

  static SnakBarShow(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.black,
    ));
  }
}
