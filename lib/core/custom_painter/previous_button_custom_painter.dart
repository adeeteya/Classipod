import 'package:flutter/cupertino.dart';

class PreviousButtonCustomPainter extends CustomPainter {
  final Color? color;

  PreviousButtonCustomPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(10, 5);
    path_0.lineTo(20, 10);
    path_0.lineTo(20, 0);
    path_0.lineTo(10, 5);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? CupertinoColors.white;
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(1, 5);
    path_1.lineTo(11, 10);
    path_1.lineTo(11, 0);
    path_1.lineTo(1, 5);
    path_1.close();

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = color ?? CupertinoColors.white;
    canvas.drawPath(path_1, paint1Fill);

    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = color ?? CupertinoColors.white;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width * 0.03, size.height),
      paint2Fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
