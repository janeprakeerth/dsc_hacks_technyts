import 'package:dsc_hacks_technyts/utils/colors.dart';
import 'package:flutter/cupertino.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double size;
  const BoldText({Key? key, required this.text, this.size = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.BlackColor,
          fontWeight: FontWeight.w600,
          fontSize: size),
    );
  }
}
