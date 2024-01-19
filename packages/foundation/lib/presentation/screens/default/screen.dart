import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Default Screen',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          color: Color(0xFFeff5f9),
        ),
      ),
    );
  }
}
