import 'package:flutter/cupertino.dart';

class PlayPauseButtonCustomPainter extends CustomPainter {
  final Color? color;

  PlayPauseButtonCustomPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(12, 6);
    path_0.lineTo(0, 12);
    path_0.lineTo(0, 0);
    path_0.lineTo(12, 6);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? CupertinoColors.white;
    canvas.drawPath(path_0, paint0Fill);

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = color ?? CupertinoColors.white;
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.6923077,
        size.height * 0.08333333,
        size.width * 0.07692308,
        size.height * 0.8333333,
      ),
      paint1Fill,
    );

    final Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = color ?? CupertinoColors.white;
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.9230769,
        size.height * 0.08333333,
        size.width * 0.07692308,
        size.height * 0.8333333,
      ),
      paint2Fill,
    );
  }

  @override
  bool shouldRepaint(PlayPauseButtonCustomPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
