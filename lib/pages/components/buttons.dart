import 'package:flutter/material.dart';
import 'package:pela_vida/pages/style/colorsGlobal.dart';
import 'package:pela_vida/pages/components/text.dart';

buttons(String _textbnt, Function action, bool _padding) {
  int _color = grey0;
  List<double> _paddingValue;
  _padding ? _paddingValue = [0, 10, 0, 0] : _paddingValue = [0, 0, 0, 0];
  return Container( //Responsavel pela margem do RaisedButton
    padding: EdgeInsets.fromLTRB(
        _paddingValue[0], _paddingValue[1], _paddingValue[2], _paddingValue[3]),
    child: RaisedButton(
      color: Color(_color),
      child: text(_textbnt, 18, black),
      onPressed: action,
    ),
  );
}
