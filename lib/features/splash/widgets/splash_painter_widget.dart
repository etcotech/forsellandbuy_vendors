import 'package:flutter/material.dart';
import 'package:sixvalley_vendor_app/helper/color_helper.dart';
import 'package:sixvalley_vendor_app/main.dart';

class SplashPainterWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = ColorHelper.blendColors(Colors.white, Theme.of(Get.context!).primaryColor, 0.4).withValues(alpha:.15)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;
    var path = Path();

    path.moveTo(0, size.height * 0.375);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.25, size.width * 0.65, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.65, size.width * 1.0, size.height * 0.60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
