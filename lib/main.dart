import 'package:facebook_interface/screens/principal.dart';
import 'package:facebook_interface/utils/CollorPallet.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: CollorPallet.scaffold
    ),
    home: Principal(),
  ));
}