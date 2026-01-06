import 'dart:async';
import 'package:flutter/material.dart';
import 'Auth/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: Lottie.asset(
                  'assets/animation/driving.json',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Vehicle Repair',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue[700],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(minHeight: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
