import 'package:flutter/material.dart';
import 'package:rental_app/authentication/export.dart';

class DashboardScreen extends StatelessWidget {
  final void Function() signOut;
  const DashboardScreen({
    Key? key,
    required this.signOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dashboard Screen',
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
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignOut(),
          ],
        ),
      ),
    );
  }
}
