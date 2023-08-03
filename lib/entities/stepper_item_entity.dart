import 'package:flutter/material.dart';

class StepperItemEntity {
  final String title;
  final Widget content;
  final VoidCallback callback;
  final IconData icon;

  StepperItemEntity(
      {required this.icon,
      required this.title,
      required this.content,
      required this.callback});
}
