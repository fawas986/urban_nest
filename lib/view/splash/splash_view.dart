import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:urban_nest/view/home/home_view.dart';
import 'package:urban_nest/view/splash/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewmodel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.initializeApp().then((_) {
          // Navigate to the next screen
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
            (Route<dynamic> route) => false,
          );
        });
      },
      viewModelBuilder: () {
        return SplashViewmodel();
      },
      builder:
          (BuildContext context, SplashViewmodel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: Color(0xFFF2F1EE),
          body: Center(
            child: Image(image: AssetImage("assets/images/logo.png")),
          ),
        );
      },
    );
  }
}
