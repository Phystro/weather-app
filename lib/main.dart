import 'package:flutter/material.dart';
import 'package:weather_app/src/app.dart';

import 'package:weather_app/src/injection.dart'
    as di;

void main() {
  di.init();
  runApp(const MyApp());
}
