import 'package:devpaul_toolkit/config/themes/custom_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomClickableText extends StatelessWidget {
  final String text;
  final VoidCallback voidCallback;
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomClickableText(
      {super.key,
      required this.text,
      required this.voidCallback,
      this.fontColor = CustomLightTheme.primaryColor,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Text(
        text,
        style: GoogleFonts.inter(
            fontSize: fontSize, color: fontColor, fontWeight: fontWeight),
      ),
    );
  }
}
