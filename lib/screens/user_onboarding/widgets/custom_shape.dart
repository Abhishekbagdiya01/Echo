import 'package:flutter/material.dart';

import '../../../widgets/logo.dart';

class CustomShape extends StatelessWidget {
  CustomShape({
    required this.height,
    super.key,
  });
  double height;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomShapePainter(),
      child: Container(
        height: height,
        child: EchoLogo(),
        // EchoLogo(titleSize: 50, descSize: 25)
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Color(0xffF8F9E2)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();

    path0.lineTo(0, size.height / 2);
    path0.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);
    path0.lineTo(size.width, 0);
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
