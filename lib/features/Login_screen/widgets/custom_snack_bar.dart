import 'package:flutter/material.dart';

typedef ShowSnackBarCallback = Function(String message, Color color);

class SnackBarDisplay extends StatelessWidget {
 final ShowSnackBarCallback showSnackBar;

 const SnackBarDisplay({
    required this.showSnackBar,
    Key? key,
 }) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return const SizedBox.shrink(); // Return an empty widget
 }
}

