import 'package:flutter/material.dart';
import 'homeScreen.dart';

void main() {
  runApp(BloodDonorRegistrationApp());
}

class BloodDonorRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      home: BloodDonorRegistrationForm(),
    );
  }
}

