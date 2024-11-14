import 'package:flutter/material.dart';
import 'pages/text_previewer.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.lightGreen,
  ),
  home: const TextPreviewer(),
));