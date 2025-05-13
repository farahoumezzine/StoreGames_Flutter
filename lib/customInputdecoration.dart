import 'package:flutter/material.dart';

class Custominputdecoration extends StatelessWidget {
  String label, hint;
  Icon icon;
  Custominputdecoration(this.label, this.hint, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  InputDecoration customDecoration() {
    return InputDecoration(
      label: Text(label),
      hintText: hint,
      suffix: icon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
    );
  }
}
