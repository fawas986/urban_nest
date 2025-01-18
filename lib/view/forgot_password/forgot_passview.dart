import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:urban_nest/view/forgot_password/forgot_pass_viewmodel.dart';
import 'package:urban_nest/view/otp_view/otp_view.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPassViewmodel>.reactive(
      viewModelBuilder: () => ForgotPassViewmodel(),
      builder:
          (BuildContext context, ForgotPassViewmodel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF2F1EE),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Password",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "An OTP has been sent to your registered email address. Please enter your email to proceed.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: viewModel.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your registered email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return OtpVerificationView(
                            email: 'fawasrahim986@gmail.com',
                          );
                        }));
                      },
                      // viewModel.sendResetLink,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: const Color(0xFF034A45),
                      ),
                      child: Text(
                        "Get OTP",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
