import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadPhotoPlaceholder extends StatelessWidget {
  const UploadPhotoPlaceholder({
    super.key,
    required this.text,
    this.width = 600,
    this.height = 300,
    this.icon = Icons.camera_alt_outlined,
    this.marginRight = 16,
    this.color = Colors.black38,
    this.borderColor = Colors.black45,
    this.fontColor = Colors.black54,
  });
  final IconData icon;
  final String text;
  final double width;
  final double height;
  final double marginRight;
  final Color color;
  final Color borderColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 8, right: marginRight),
      decoration: BoxDecoration(
        // color: CustomLightTheme.secondaryBorderColor,
        color: color,
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: fontColor,
            size: 56,
          ),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
                color: fontColor, fontWeight: FontWeight.w600, fontSize: 18),
          )
        ],
      ),
    );
  }
}
