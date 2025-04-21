import 'dart:async';

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

  static Future<bool> deleteUser(
    BuildContext context,
    String title,
    String message, {
    bool fechaContext = false,
  }) async {
    final Completer<bool> completer = Completer<bool>();

    AwesomeDialog(
      context: context,
      btnOkColor: Colors.green,
      btnOkText: 'Sim',
      btnCancelColor: Colors.redAccent,
      btnCancelText: 'Não',
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      title: title,
      desc: message,
      btnOkOnPress: () {
        if (fechaContext) {
          Navigator.pop(context);
        }
        completer.complete(true); // Usuário confirmou
      },
      btnCancelOnPress: () {
        if (fechaContext) {
          Navigator.pop(context);
        }
        completer.complete(false); // Usuário cancelou
      },
    ).show();

    return completer.future; // Aguarda o resultado
  }
}
