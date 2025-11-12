import 'package:flutter/material.dart';
import 'package:vizoo/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  const CustomButton({super.key, required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(double.infinity, 50),
        ),
        child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
