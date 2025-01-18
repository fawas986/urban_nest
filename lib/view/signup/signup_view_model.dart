import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../login/login_view.dart';

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCountryCode = "+91";

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    notifyListeners();
  }

  void signUp() {
    print("User signed up with email: ${emailController.text}");
    print("Phone number: $selectedCountryCode${phoneNumberController.text}");
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }

  void updateCountryCode(String code) {
    selectedCountryCode = code;
    notifyListeners();
  }
}
