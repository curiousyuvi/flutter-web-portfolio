import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final int index;
  final bool isButton;

  HeaderItem({
    this.title,
    this.index,
    this.isButton = false,
  });
}
