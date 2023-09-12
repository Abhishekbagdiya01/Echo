import 'package:echo/widgets/text_styles.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.voidCallback,
    required this.title,
    super.key,
  });
  final VoidCallback voidCallback;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: topLogoColor),
          ),
          child: Center(
            child: Text(
              title,
              style: interTextStyle(
                  color: topLogoColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
