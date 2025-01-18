import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:urban_nest/view/forgot_password/forgot_passview.dart';

import '../signup/signup_view.dart';

class LoginViewmodel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      setBusy(true);
      await Future.delayed(const Duration(seconds: 2));
      setBusy(false);

      if (emailController.text == "test@example.com" &&
          passwordController.text == "password123") {
        print("Login successful!");
      } else {
        print("Invalid email or password!");
      }
    }
  }

  void forgotPassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ForgotPassView(),
      ),
    );
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpView(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
