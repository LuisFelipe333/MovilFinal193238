import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class SplashCanvas extends CustomPainter {
  final ui.Image? imageCanvas;

  const SplashCanvas(this.imageCanvas);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color(0xFF76AB56);

    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * 0.05);

    path.quadraticBezierTo(size.width * 0.15, size.height * 0.12,
        size.width * 0.27, size.height * 0.08);

    path.quadraticBezierTo(size.width * 0.45, size.height * 0.02,
        size.width * 0.7, size.height * 0.05);
    path.quadraticBezierTo(
        size.width * 0.88, size.height * 0.08, size.width, size.height * 0.07);

    path.lineTo(size.width, 0);

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
        size.width * 0.65, size.height * 0.8, size.width, size.height);

    canvas.drawPath(path, paint);

    canvas.scale(0.25, 0.25);

    final centerX = imageCanvas != null
        ? (size.width - (imageCanvas!.width * 0.25)) * 2
        : 0.0;
    final centery = imageCanvas != null
        ? (size.height - (imageCanvas!.height * 0.25)) * 2
        : 0.0;

    if (imageCanvas != null) {
      canvas.drawImage(imageCanvas!, Offset(centerX, centery), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
