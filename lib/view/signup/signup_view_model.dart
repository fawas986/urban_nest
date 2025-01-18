import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../login/login_view.dart';

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController(); // Added for phone number

  String selectedCountryCode = "+1"; // Default to USA country code

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
    // Your sign up logic (API call, validation, etc.)
    print("User signed up with email: ${emailController.text}");
    print("Phone number: $selectedCountryCode${phoneNumberController.text}");
    // You can add more logic for handling sign-up here, such as making an API call
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginView()), // Replace with your LoginView widget
    );
  }

  // Function to update selected country code
  void updateCountryCode(String code) {
    selectedCountryCode = code;
    notifyListeners();
  }
}
