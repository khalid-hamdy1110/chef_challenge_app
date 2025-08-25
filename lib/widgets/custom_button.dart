import 'package:chef_challenge_project/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    required this.margin,
    this.color,
  });

  final void Function()? onPressed;
  final String label;
  final SvgPicture icon;
  final EdgeInsets margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 48,
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        icon: CustomText(
          text: label,
          nunito: true,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: TextColor.white,
        ),
        label: icon,
        backgroundColor: color ?? const Color.fromRGBO(219, 122, 43, 1),
      ),
    );
  }
}
