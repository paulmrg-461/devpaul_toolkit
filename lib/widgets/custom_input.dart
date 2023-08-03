import 'package:devpaul_toolkit/config/themes/custom_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool? passwordVisibility;
  final TextInputType? textInputType;
  final bool? obscureText;
  final TextCapitalization? textCapitalization;
  final bool? enabledInputInteraction;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? fontColor;
  final int? minLines;
  final int? maxLines;
  final int? maxLenght;
  final bool? expands;
  final double? width;
  final double? marginBottom;

  const CustomInput({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.icon,
    this.passwordVisibility = false,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.enabledInputInteraction = true,
    this.textCapitalization = TextCapitalization.none,
    this.borderRadius = 14,
    this.backgroundColor = Colors.white,
    this.borderColor = CustomLightTheme.primaryColor,
    this.fontColor = Colors.black54,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLenght,
    this.expands = false,
    this.width,
    this.marginBottom = 16,
  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder getBorder(
            {required Color borderColor, required double borderWidth}) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        );

    return Container(
        width: widget.width,
        margin: EdgeInsets.only(bottom: widget.marginBottom!),
        //padding: EdgeInsets.only(top: 6, left: 6, right: 18),
        decoration: BoxDecoration(
          color: widget.backgroundColor!,
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        child: TextFormField(
          onChanged: widget.onChanged,
          validator: widget.validator,
          minLines: widget.minLines!,
          maxLines: widget.maxLines!,
          maxLength: widget.maxLenght,
          expands: widget.expands!,
          style: GoogleFonts.inter(
              color: widget.fontColor!,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          autocorrect: false,
          keyboardType: widget.textInputType,
          obscureText: (widget.obscureText! && passwordObscure) ? true : false,
          enabled: widget.enabledInputInteraction,
          textCapitalization: widget.textCapitalization!,
          decoration: InputDecoration(
              isCollapsed: true,
              prefixIcon: Icon(
                widget.icon,
                color: widget.borderColor,
              ),
              suffixIcon: widget.passwordVisibility!
                  ? IconButton(
                      color: widget.borderColor,
                      icon: Icon(passwordObscure
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => setState(() {
                        passwordObscure = !passwordObscure;
                      }),
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              focusedBorder:
                  getBorder(borderColor: widget.borderColor!, borderWidth: 1.2),
              border: getBorder(
                  borderColor:
                      widget.borderColor ?? CustomLightTheme.primaryColor,
                  borderWidth: 0.75),
              errorBorder: getBorder(
                  borderColor: Colors.red.shade800, borderWidth: 0.75),
              focusedErrorBorder:
                  getBorder(borderColor: Colors.red.shade800, borderWidth: 1.2),
              labelText: widget.hintText,
              labelStyle: TextStyle(
                color: widget.fontColor!,
                fontSize: 14,
              ),
              counterText: ''),
        ));
  }
}
