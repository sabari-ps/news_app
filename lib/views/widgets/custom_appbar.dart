import 'package:flutter/material.dart';

customAppBar() {
  return AppBar(
    title: const Text(
      "News App",
      style: TextStyle(
        fontSize: 24.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
