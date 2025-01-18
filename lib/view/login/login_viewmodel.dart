import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:urban_nest/view/forgot_password/forgot_passview.dart';

import '../signup/signup_view.dart';

class LoginViewmodel extends BaseViewModel {
  // Controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Form key to validate the form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Password visibility toggle
  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;

  // Toggle password visibility
  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners(); // Notify UI to update
  }

  // Perform login action
  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      // Example login logic (replace with actual API or authentication logic)
      setBusy(true); // Indicate a loading state
      await Future.delayed(const Duration(seconds: 2)); // Simulated delay
      setBusy(false);

      // Check credentials (replace with real validation)
      if (emailController.text == "test@example.com" &&
          passwordController.text == "password123") {
        // Navigate to the next screen or perform success actions
        print("Login successful!");
      } else {
        // Show an error message or handle failed login
        print("Invalid email or password!");
      }
    }
  }

  // Navigate to Forgot Password screen
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
    // Clean up controllers to prevent memory leaks
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
