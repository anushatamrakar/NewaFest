import 'package:flutter/material.dart';

class DisplayMessage extends StatelessWidget {
  final String message;
  final AlertType type;

  const DisplayMessage({
    super.key,
    required this.message,
    required this.type,
  });

  // Display the alert dialog
  static void displayMessage(BuildContext context, String message, AlertType type) {
    showDialog(
      context: context,
      builder: (context) {
        return DisplayMessage(
          message: message,
          type: type,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Icon(
        type == AlertType.success ? Icons.check_circle : Icons.error,
        size: 50,
        color: type == AlertType.success ? Colors.green : Colors.red,
      ),
      content: Text(
        message,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

enum AlertType { success, error }