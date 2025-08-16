import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ali_app/features/auth/auth_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "BIENVENIDO",
          body: "\"Aventuras con Lenguas Indígenas\"",
          image: Center(child: Image.asset("assets/1.png", height: 250)),
        ),
        PageViewModel(
          title: "APRENDE",
          body: "Explora juegos y dinámicas para aprender vocabulario indígena.",
          image: Center(child: Image.asset("assets/2.png", height: 250)),
        ),
        PageViewModel(
          title: "COMIENZA",
          body: "Empieza ahora a disfrutar de la experiencia educativa.",
          image: Center(child: Image.asset("assets/3.png", height: 250)),
        ),
      ],
      onDone: () => _completeOnboarding(context),
      onSkip: () => _completeOnboarding(context),
      showSkipButton: true,
      skip: const Text("Saltar"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Comenzar", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        activeColor: Colors.orange,
        size: Size(10.0, 10.0),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
