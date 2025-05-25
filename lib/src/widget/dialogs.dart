import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

TextEditingController pass = TextEditingController();

class Dialogs {
  static information(BuildContext context, String Title, String Message,
      {bool fechaContext = false}) async {
    return AwesomeDialog(
      context: context,
      btnOkColor: Colors.blue,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      title: Title,
      desc: Message,
      btnOkOnPress: () {
        if (fechaContext) {
          Navigator.pop(context);
        }
      },
    )..show();
  }

  static error(BuildContext context, String Title, String Message,
      {bool fechaContext = false}) async {
    return AwesomeDialog(
      context: context,
      btnOkColor: Colors.redAccent,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: Title,
      desc: Message,
      btnOkOnPress: () {
        if (fechaContext) {
          Navigator.pop(context);
        }
      },
    )..show();
  }

  static warning(BuildContext context, String Title, String Message,
      {bool fechaContext = false}) async {
    return AwesomeDialog(
      context: context,
      btnOkColor: Colors.amber,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: Title,
      desc: Message,
      btnOkOnPress: () {
        if (fechaContext) {
          Navigator.pop(context);
        }
      },
    )..show();
  }

  static success(BuildContext context, String Title, String Message,
      {bool fechaContext = false}) async {
    return AwesomeDialog(
      context: context,
      btnOkColor: Colors.green,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: Title,
      desc: Message,
      btnOkOnPress: () {
        if (fechaContext) {
          Navigator.pop(context);
        }
      },
    )..show();
  }
}
