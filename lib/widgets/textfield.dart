import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool required;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    required this.label,
    this.required = false,
    this.keyboardType,
    this.maxLength,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: required ? '$label *' : label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        counterText: '',
      ),
      keyboardType: keyboardType,
      maxLength: maxLength,
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

