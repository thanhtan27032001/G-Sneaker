import 'package:flutter/material.dart';
import 'package:gsneaker/app/configs/app_text_style.dart';

class AppTextBuilder {
  String? _text;
  TextStyle? _textStyle;
  TextAlign? _textAlign;
  int? _maxLines;
  TextOverflow? _textOverflow;
  Color? _color;

  Widget build(BuildContext context) {
    const orgTextStyle = TextStyle(fontSize: AppTextStyle.fontSizeBody1);
    if (_textStyle == null) {
      setTextStyle(orgTextStyle);
    } else {
      setTextStyle(
        _textStyle?.copyWith(fontSize: orgTextStyle.fontSize, fontFamily: "Rubik"),
      );
    }
    final textStyle = _textStyle?.copyWith(color: _color ?? _textStyle?.color);
    return Text(
      _text ?? '-',
      textAlign: _textAlign,
      style: textStyle,
      maxLines: _maxLines,
      overflow: _textOverflow,
    );
  }

  AppTextBuilder setMaxLines(int? maxLines) {
    _maxLines = maxLines;
    return this;
  }

  AppTextBuilder setText(String? text) {
    _text = text;
    return this;
  }

  AppTextBuilder setTextAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  AppTextBuilder setTextOverFlow(TextOverflow? textOverflow) {
    _textOverflow = textOverflow;
    return this;
  }

  AppTextBuilder setTextStyle(TextStyle? textStyle) {
    _textStyle = textStyle;
    return this;
  }

  AppTextBuilder setColor(Color? color) {
    _color = color;
    return this;
  }
}