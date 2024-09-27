import 'package:flutter/material.dart';

/// Class to create custom dialog
class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onButtonClick,
    required this.buttonBackgroundColor,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonTextColor,
    this.paddingLeft,
    this.paddingRight,
  });

  final String buttonText;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? paddingLeft;
  final double? paddingRight;
  final Color? buttonTextColor;
  final VoidCallback? onButtonClick;
  final WidgetStateProperty<Color> buttonBackgroundColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

/// State class of custom button
class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonHeight ?? 48,
      width: widget.buttonWidth ?? double.infinity,
      child: ElevatedButton(
        key: null,
        onPressed: widget.onButtonClick,
        style: ButtonStyle(
          backgroundColor: widget.buttonBackgroundColor,
          elevation: WidgetStateProperty.all(0.0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(color: widget.buttonTextColor ?? Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
