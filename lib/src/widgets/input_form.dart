import 'package:flutter/material.dart';

class InputFormWidget extends StatelessWidget {
  final Icon? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool isError;
  final String? errorMessage;
  final bool isAutoFocus;
  final bool isPassword;
  final double padding;
  final double boderRadius;
  final Color borderColor;
  final Color? fillColor;
  final bool? isFilled;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final String? initialValue;
  final bool readonly;
  final void Function(String)? onChanged;

  const InputFormWidget({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.isError = false,
    this.errorMessage,
    this.isAutoFocus = false,
    this.isPassword = false,
    this.padding = 20,
    this.boderRadius = 50,
    this.borderColor = Colors.white,
    this.fillColor = Colors.transparent,
    this.isFilled = false,
    this.onEditingComplete,
    this.focusNode,
    this.initialValue,
    this.readonly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        onChanged: onChanged,
        readOnly: readonly,
        initialValue: initialValue,
        autofocus: isAutoFocus,
        obscureText: isPassword,
        controller: controller,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(padding),
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.white,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.white,
          fillColor: fillColor,
          filled: isFilled,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(boderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(boderRadius),
          ),
          hoverColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          errorText: errorMessage,
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
