import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/strings.dart';
import 'core/providers/domini_provider.dart';
import 'core/providers/invite_provider.dart';
import 'core/providers/location_provider.dart';
import 'routes.dart';

/// Method which called very first when app started
void main() {
  runApp(const MyApp());
}

/// Class of initial material widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Method to build material widget
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => InviteProvider()),
        ChangeNotifierProvider(create: (_) => DominiProvider()),
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: Routes.routes,
      ),
    );
  }
}
