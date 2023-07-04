import 'package:flutter/material.dart';

class CustomNavDestination extends StatelessWidget {
  final IconData icon;
  final String label;

  const CustomNavDestination({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(icon),
      label: label,
    );
  }
}
