import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text(
          'Profile screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}