import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get currentTheme => Theme.of(context);
  //Dinamik boyutlandırma kodları eklenebilir gerekirse
  //double dynamicHeight(double value) => MediaQuery.of(context).size.height * value;
}
