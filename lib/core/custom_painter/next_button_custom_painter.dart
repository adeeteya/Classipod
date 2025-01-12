import 'package:flutter/cupertino.dart';

class NextButtonCustomPainter extends CustomPainter {
  final Color? color;

  NextButtonCustomPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width - 10, 5);
    path_0.lineTo(size.width - 20, 10);
    path_0.lineTo(size.width - 20, 0);
    path_0.lineTo(size.width - 10, 5);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? CupertinoColors.white;
    canvas.drawPath(path_0, paint0Fill);
    final Path path_1 = Path();
    path_1.moveTo(size.width, 5);
    path_1.lineTo(size.width - 10, 10);
    path_1.lineTo(size.width - 10, 0);
    path_1.lineTo(size.width, 5);
    path_1.close();

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = color ?? CupertinoColors.white;
    canvas.drawPath(path_1, paint1Fill);

    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = color ?? CupertinoColors.white;
    canvas.drawRect(
      Rect.fromLTWH(
        size.width,
        0,
        size.width * 0.03,
        size.height,
      ),
      paint2Fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
