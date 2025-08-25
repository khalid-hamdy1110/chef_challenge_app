import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TextColor { white, grey, orange, green, red }

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.nunito,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.timer,
  });

  final String text;
  final bool nunito;
  final double fontSize;
  final FontWeight fontWeight;
  final TextColor color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool? timer;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: timer == true
          ? GoogleFonts.kaiseiTokumin(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
              fontFeatures: [const FontFeature.tabularFigures()],
            )
          : nunito
          ? GoogleFonts.nunito(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            )
          : GoogleFonts.hedvigLettersSerif(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            ),
    );
  }

  Color get textColor {
    switch (color) {
      case TextColor.white:
        return Colors.white;
      case TextColor.grey:
        return const Color.fromRGBO(136, 132, 129, 1);
      case TextColor.orange:
        return const Color.fromRGBO(219, 122, 43, 1);
      case TextColor.green:
        return const Color.fromRGBO(35, 157, 102, 1);
      case TextColor.red:
        return const Color.fromRGBO(221, 76, 76, 1);
    }
  }

  TextStyle get nunitoStyle {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor,
    );
  }
}
