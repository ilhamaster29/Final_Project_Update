import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splash_screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF149C92),
              Color(0xFF185D5A),
            ],
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icon/car_rental.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                  const Text(
                    'Halo! Selamat Datang',
                    style: TextStyle(
                        height: 3,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ],
              ),
              const CircularProgressIndicator(),
            ]),
      ),
    );
  }
}
