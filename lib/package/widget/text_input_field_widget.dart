import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final void Function(String?) onSave;
  final bool isRequired;
  final int maxLines;
  final TextInputType keyboardType;

  const TextInputField({
    super.key,
    required this.label,
    required this.onSave,
    this.isRequired = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      onSaved: onSave,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: isRequired ? (val) => (val == null || val.trim().isEmpty) ? 'Required' : null : null,
    );
  }
}