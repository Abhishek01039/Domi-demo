import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';

/// CLass to show profile screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  /// Build method to load ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(Strings.profile),
        centerTitle: true,
        elevation: 4,
      ),
      body: const Center(
        child: Text(Strings.profileScreen),
      ),
    );
  }
}
