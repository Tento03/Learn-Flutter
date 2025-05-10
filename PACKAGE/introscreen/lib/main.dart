import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Selamat Datang!",
          body: "Aplikasi ini akan memudahkan hidupmu.",
          image: Lottie.asset('assets/lotie.json', width: 250),
        ),
        PageViewModel(
          title: "Cepat & Mudah",
          body: "Navigasi yang intuitif dan responsif.",
          image: Lottie.asset('assets/lotie.json', width: 250),
        ),
        PageViewModel(
          title: "Ayo Mulai!",
          body: "Waktunya kamu merasakan manfaatnya.",
          image: Lottie.asset('assets/lotie.json', width: 250),
        ),
      ],
      onDone: () {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      },
      showSkipButton: true,
      skip: Text("Lewati"),
      next: Icon(Icons.arrow_forward),
      done: Text("Mulai", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
        size: Size.square(10.0),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.blue,
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda")),
      body: Center(child: Text("Ini halaman utama 🎉")),
    );
  }
}
