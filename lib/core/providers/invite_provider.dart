import 'package:flutter/cupertino.dart';

/// Provider class for invite dialog visibility
class InviteProvider extends ChangeNotifier {
  bool showInviteDialog = false;

  /// Method of update showInviteDialog param
  void updateInviteDialogVisibility(bool visible) {
    showInviteDialog = visible;
    notifyListeners();
  }
}
