import 'package:flutter/material.dart';

import 'ui/screens/home_screen.dart';
import 'ui/screens/message_screen.dart';
import 'ui/screens/profile_screen.dart';

/// Class to manage named routing in entire application
class Routes {
  Routes._();

  static const String initialScreen = '/';
  static const String profileScreen = '/profileScreen';
  static const String messageScreen = '/messageScreen';

  /// Method to return routing
  static final routes = <String, WidgetBuilder>{
    initialScreen: (ctx) => const HomeScreen(),
    profileScreen: (ctx) => const ProfileScreen(),
    messageScreen: (ctx) => const MessageScreen(),
  };
}
