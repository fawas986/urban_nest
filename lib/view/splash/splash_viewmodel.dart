import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashViewmodel extends BaseViewModel {
  Future<void> initializeApp() async {
    // Simulate some initialization work like fetching data or checking login status
    await Future.delayed(Duration(seconds: 3));
    // Add logic here for navigation after initialization
  }
}
