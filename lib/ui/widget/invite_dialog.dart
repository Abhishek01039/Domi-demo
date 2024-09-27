import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/strings.dart';
import '../../core/providers/invite_provider.dart';
import 'custom_button.dart';

/// Class for show invitation dialog at bottom on home screen
class InviteDialog extends StatelessWidget {
  const InviteDialog({super.key});

  /// Build method to draw dialog design widget
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 16,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: Offset(0.0, 10.0))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                const Expanded(
                  child: Text(
                    Strings.inviteTitle,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () => Provider.of<InviteProvider>(context, listen: false).updateInviteDialogVisibility(false),
                  child: const Icon(Icons.close, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              Strings.inviteDesc,
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              buttonText: Strings.sendInvite,
              buttonBackgroundColor: WidgetStatePropertyAll(Colors.white),
              buttonTextColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
