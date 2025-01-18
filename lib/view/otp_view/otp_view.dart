import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:stacked/stacked.dart';

import 'otp_view_model.dart';


class OtpVerificationView extends StatelessWidget {
  final String email;

  const OtpVerificationView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpVerificationViewModel>.reactive(
      viewModelBuilder: () => OtpVerificationViewModel(email: email),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF2F1EE),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  "OTP Verification",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Instruction Text
                Text(
                  "Enter the 6-digit OTP sent to your email: ${viewModel.email}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // OTP Input Field
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: const Color(0xFF034A45),
                  showFieldAsBox: true,
                  onSubmit: viewModel.verifyOtp,
                  fieldWidth: 45,
                ),
                const SizedBox(height: 30),

                // Timer and Resend Button
                Text(
                  "Resend OTP in ${viewModel.remainingTime} seconds",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: viewModel.isResendEnabled ? viewModel.resendOtp : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: viewModel.isResendEnabled
                          ? const Color(0xFF034A45)
                          : Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "Resend OTP",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
