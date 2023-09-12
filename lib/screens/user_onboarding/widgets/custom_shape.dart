import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/logo.dart';

class UpperShape extends StatelessWidget {
  UpperShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomShapePainter(),
      child: Stack(
        children: [
          SizedBox(
            child: SvgPicture.asset(
              "assets/images/upper_shape.svg",
              // height: MediaQuery.sizeOf(context).height * .30,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.05,
              left: MediaQuery.sizeOf(context).width * 0.15,
              child: EchoLogo())
        ],
      ),
    );
  }
}

class BottomShape extends StatelessWidget {
  const BottomShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/bottom_shape.svg",
      width: MediaQuery.sizeOf(context).width,
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
