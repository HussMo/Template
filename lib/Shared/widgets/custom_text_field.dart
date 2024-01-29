// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
 final String hintText;
 final IconData icon;
 final FormFieldValidator<String> validator;
 final TextEditingController controller;

  const CustomTextFormField({super.key, 
    required this.hintText,
    required this.icon,
    required this.validator,
    required this.controller
 });

 @override
 Widget build(BuildContext context) {
    return _buildTextField(hintText, icon, validator);
 }

 TextFormField _buildTextField(String hintText, IconData icon, FormFieldValidator<String> validator) {
    return TextFormField(
      onChanged: (value) => value = hintText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none),
        fillColor: Colors.purple.withOpacity(0.1),
        filled: true,
        prefixIcon: Icon(icon)),
    );
 }
}
