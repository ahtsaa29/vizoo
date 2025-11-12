import 'package:flutter/material.dart';
import 'package:vizoo/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback ontap;
  final IconData iconData;
  final String text;
  const HomeMeetingButton({
    super.key,
    required this.ontap,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black45,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(iconData, color: Colors.white, size: 30),
          ),
          SizedBox(height: 10),
          Text(text, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
