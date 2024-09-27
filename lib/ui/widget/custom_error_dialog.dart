import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';

/// Class to show custom error dialog
class CustomErrorDialog extends StatelessWidget {
  final String message;

  /// Initial constructor
  const CustomErrorDialog({super.key, required this.message});

  /// Build method
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  /// Method for content of error dialog
  Widget contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: Offset(0.0, 10.0))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            Strings.error,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16.0),
          Text(message, style: const TextStyle(fontSize: 16.0), textAlign: TextAlign.start),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(Strings.okay, style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ),
        ],
      ),
    );
  }
}

/// Method to show error dialog
void showErrorDialog(String message, BuildContext context) {
  showDialog(context: context, builder: (BuildContext ctx) => CustomErrorDialog(message: message));
}
