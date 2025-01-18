import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:urban_nest/view/login/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewmodel>.reactive(
      viewModelBuilder: () => LoginViewmodel(),
      builder: (BuildContext context, LoginViewmodel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF2F1EE), // Subtle background color
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/logo3.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Welcome Text
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 10),
                    Text("Log in to your account to continue",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        )),
                    const SizedBox(height: 30),

                    // Email TextField
                    TextFormField(
                      controller: viewModel.emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.grey, // Default border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF034A45), // Border color when focused
                            width: 2.0, // Optional: You can also adjust the border width
                          ),
                        ),
                        prefixIcon: const Icon(Icons.email),
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
                    SizedBox(height: 15,),


                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.isPasswordHidden,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.grey, // Default border color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF034A45), // Border color when focused
                            width: 2.0, // Optional: Adjust width when focused
                          ),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 238,
                        ),
                        TextButton(
                          onPressed: () {
                            viewModel.forgotPassword(context);
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xFF034A45),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Login Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF034A45),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (viewModel.formKey.currentState?.validate() ??
                              false) {
                            viewModel.login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),backgroundColor: Color(0xFF034A45)
                        ),
                        child:  Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                            )
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              viewModel.navigateToSignUp(context);
                            },
                            child:  Text(
                              "Sign Up",
                              style: GoogleFonts.poppins(textStyle:  const TextStyle(
                                color: Color(0xFF034A45),
                                fontWeight: FontWeight.w600,
                              ),)
                            ),
                          ),
                        ],
                      ),
                    ),


                    const SizedBox(height: 20),
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
                          )
                          , const SizedBox(
                            width: 50,
                          ),
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
                          )
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
