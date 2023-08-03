import 'package:devpaul_toolkit/config/themes/custom_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? borderRadius;
  final double buttonElevation;
  final double internalHorizontalPadding;
  final double internalVerticalPadding;
  final bool? rightIcon;
  const CustomButton(
      {Key? key,
      this.icon,
      required this.text,
      this.onPressed,
      this.width,
      this.fontSize = 16,
      this.fontColor = Colors.white,
      this.fontWeight = FontWeight.w700,
      this.backgroundColor = CustomLightTheme.primaryColor,
      this.borderRadius = 14,
      this.borderColor = CustomLightTheme.primaryColor,
      this.buttonElevation = 0,
      this.internalHorizontalPadding = 16,
      this.internalVerticalPadding = 10,
      this.rightIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> listWidget = [
      Icon(
        icon,
        color: fontColor,
      ),
      const SizedBox(
        width: 8,
      ),
      Text(
        text,
        style: GoogleFonts.inter(
            fontSize: fontSize!, color: fontColor!, fontWeight: fontWeight!),
      ),
      SizedBox(
        width: rightIcon! ? 14 : 0,
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(bottom: 6),
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  onPressed == null ? Colors.black26 : backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      side: BorderSide(
                          color: onPressed == null
                              ? Colors.black26
                              : borderColor!))),
              elevation: MaterialStateProperty.all(buttonElevation)),
          onPressed: onPressed,
          child: (icon == null)
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: internalVerticalPadding,
                      horizontal: internalHorizontalPadding),
                  child: Text(text,
                      style: GoogleFonts.inter(
                          fontSize: fontSize!,
                          color: fontColor!,
                          fontWeight: fontWeight!)),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: internalVerticalPadding,
                      horizontal: internalHorizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        rightIcon! ? listWidget.reversed.toList() : listWidget,
                  ),
                )),
    );
  }
}
