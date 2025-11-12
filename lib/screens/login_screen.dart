import 'package:flutter/material.dart';
import 'package:vizoo/resources/auth_methods.dart';
import 'package:vizoo/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 38,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Start or Join meeting",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Image.asset('assets/images/onboarding.jpg'),
          CustomButton(
            text: "Google Sign In",
            ontap: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
