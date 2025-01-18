import 'dart:async';
import 'package:stacked/stacked.dart';

class OtpVerificationViewModel extends BaseViewModel {
  final String email;
  late Timer _timer;
  int _remainingTime = 60;
  bool _isResendEnabled = false;

  int get remainingTime => _remainingTime;
  bool get isResendEnabled => _isResendEnabled;

  OtpVerificationViewModel({required this.email}) {
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = 60;
    _isResendEnabled = false;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        notifyListeners();
      } else {
        timer.cancel();
        _isResendEnabled = true;
        notifyListeners();
      }
    });
  }

  void resendOtp() {
    if (_isResendEnabled) {
      _startTimer();

      notifyListeners();
    }
  }

  void verifyOtp(String otp) {}

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
