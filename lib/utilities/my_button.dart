import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected; // Indicates if this button is currently active.

  const MyButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(105, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
            color: isSelected ? Colors.black : Colors.grey[500]!,
            width: 2,
          ),
          backgroundColor: isSelected ? Colors.amber[300] : Colors.amber[50],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey[800],
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
