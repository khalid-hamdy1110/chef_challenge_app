import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(43, 46, 51, 0),
                    Color.fromRGBO(43, 46, 51, 0.85),
                    Color.fromRGBO(43, 46, 51, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Transform.rotate(
            angle: pi / 4,
            child: Container(
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(43, 46, 51, 1),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            'assets/icons/divider_middle_design.svg',
            width: 23,
            height: 24,
          ),
          const SizedBox(width: 8),
          Transform.rotate(
            angle: pi / 4,
            child: Container(
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(43, 46, 51, 1),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(43, 46, 51, 1),
                    Color.fromRGBO(43, 46, 51, 0.93),
                    Color.fromRGBO(43, 46, 51, 0),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
