import 'dart:async';
import 'package:flutter/material.dart';
import 'index/YKLIndexPage.dart';


void main() async {

  runZoned<Future<Null>> (() async{
    runApp(new YKLIndexPage());
  }, onError: (error, stackTrace) async{
    print("flutter zone catch an error");
  });
}