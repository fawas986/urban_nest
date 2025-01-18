import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPassViewmodel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  bool isResetLinkSent = false;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  Future<void> sendResetLink() async {
    if (formKey.currentState?.validate() ?? false) {
      setBusy(true);
      try {
        await _sendResetLinkApiCall();
        isResetLinkSent = true;
        notifyListeners();
      } catch (e) {
        print('Error sending reset link: $e');
        isResetLinkSent = false;
      } finally {
        setBusy(false);
      }
    }
  }

  Future<void> _sendResetLinkApiCall() async {
    await Future.delayed(const Duration(seconds: 2));

    throw Exception('Failed to send reset link');
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
