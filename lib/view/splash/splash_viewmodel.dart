import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashViewmodel extends BaseViewModel {
  Future<void> initializeApp() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
