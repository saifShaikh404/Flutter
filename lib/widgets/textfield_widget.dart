import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final String label;
  final TextEditingController controller;

  const TextFieldWidget({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        style: Theme.of(context).textTheme.bodySmall,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
