import 'package:flutter/cupertino.dart';

class ConfigSize {
  static double width, height;
  static void setSize(BuildContext context) {
    final meida = MediaQuery.of(context);
    width = meida.size.width;
    height = meida.size.height;
  }
}
