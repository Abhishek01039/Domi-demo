import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';

/// Class to show message screen
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  /// Build method to load ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(Strings.message),
        centerTitle: true,
        elevation: 4,
      ),
      body: const Center(
        child: Text(Strings.messageScreen),
      ),
    );
  }
}
