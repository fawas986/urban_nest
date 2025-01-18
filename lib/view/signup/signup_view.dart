import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:urban_nest/view/signup/signup_view_model.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder:
          (BuildContext context, SignUpViewModel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF2F1EE),
          body: SingleChildScrollView(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    // Sign Up Text
                    Text(
                      "Create an Account",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 10),
                    Text("Sign up to get started",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        )),
                    const SizedBox(height: 30),

                    // Name TextField
                    TextFormField(
                      controller: viewModel.nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter your name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFF034A45)), // Set border color on focus
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // Email TextField
                    TextFormField(
                      controller: viewModel.emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.email),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFF034A45)), // Set border color on focus
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // Phone Number with Country Code Picker
                    Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (countryCode) {
                            viewModel.selectedCountryCode = countryCode.dialCode!;
                          },
                          initialSelection: '+91', // Set default country code
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: viewModel.phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              hintText: "Enter your phone number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Color(0xFF034A45)), // Set border color on focus
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your phone number";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Password TextField
                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.isPasswordHidden,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: viewModel.togglePasswordVisibility,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFF034A45)), // Set border color on focus
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters long";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // Confirm Password TextField
                    TextFormField(
                      controller: viewModel.confirmPasswordController,
                      obscureText: viewModel.isConfirmPasswordHidden,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Re-enter your password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isConfirmPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: viewModel.toggleConfirmPasswordVisibility,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFF034A45)), // Set border color on focus
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }
                        if (value != viewModel.passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Sign Up Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xFF034A45),
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        onPressed: () {
                          if (viewModel.formKey.currentState?.validate() ?? false) {
                            viewModel.signUp();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            backgroundColor: const Color(0xFF034A45)),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              viewModel.navigateToLogin(context);
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color(0xFF034A45),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),

                    // Sign Up Link
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                                color: Color(0xFF034A45), // Add a color to the border
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            child: Image.asset("assets/images/google.png"),
                          ),
                          const SizedBox(width: 50),
                          Container(
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                                color: Color(0xFF034A45), // Add a color to the border
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            child: Image.asset("assets/images/facebook.png"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
