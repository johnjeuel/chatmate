
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixColor;
  final bool enabled;
  final String? errorText;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final InputBorder? border;
  final bool isValidated;
  final bool obscureText;


  AppTextFormField({this.prefixIcon, this.prefixColor,
    this.suffixIcon, this.enabled = true,
    this.errorText, this.hintText, this.labelText,
    this.border, this.isValidated = true, this.initialValue,
    this.onChanged, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
      if (value == null || value.isEmpty) {
        return '$labelText is required';
      }
      return null;
    },

      obscureText: obscureText,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: (prefixIcon != null)
            ? Icon(
          prefixIcon,
          color: prefixColor,
        )
            : null,
        prefixIconConstraints: const BoxConstraints(minHeight: 35, minWidth: 40),
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(minHeight: 35, minWidth: 40),
        // fillColor,
        suffix: enabled ? null : const Icon(Icons.lock_outlined, size: 10),
        enabled: enabled,
        errorText: errorText,
        hoverColor: Colors.white,
        isCollapsed: true,
        hintText: hintText,
        isDense: false,
        contentPadding: const EdgeInsets.only(left: 25.0, right: 15.0, top: 16, bottom: 9),
        filled: true,
        border: border,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:  (isValidated ? const Color.fromRGBO(44, 160, 28, 1.0) : Colors.red),
                width: 1.0)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 1), width: 0.2),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(200, 200, 200, 1), width: 1.0),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}