import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text('Error Screen'),
            ],
          ),
        ),
      ),
    );
  }
}
