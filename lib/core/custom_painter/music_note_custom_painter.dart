import 'package:flutter/cupertino.dart';

class MusicNoteCustomPainter extends CustomPainter {
  final Color? color;
  MusicNoteCustomPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.9830449, size.height * 0.01159961);
    path_0.cubicTo(
      size.width * 0.9722910,
      size.height * 0.002410156,
      size.width * 0.9580781,
      size.height * -0.001617188,
      size.width * 0.9440645,
      size.height * 0.0005937500,
    );
    path_0.lineTo(size.width * 0.3311621, size.height * 0.09736719);
    path_0.cubicTo(
      size.width * 0.3076465,
      size.height * 0.1010801,
      size.width * 0.2903242,
      size.height * 0.1213516,
      size.width * 0.2903242,
      size.height * 0.1451602,
    );
    path_0.lineTo(size.width * 0.2903242, size.height * 0.3387090);
    path_0.lineTo(size.width * 0.2903242, size.height * 0.6451602);
    path_0.lineTo(size.width * 0.1935488, size.height * 0.6451602);
    path_0.cubicTo(
      size.width * 0.08682617,
      size.height * 0.6451621,
      0,
      size.height * 0.7247520,
      0,
      size.height * 0.8225801,
    );
    path_0.cubicTo(
      0,
      size.height * 0.9204102,
      size.width * 0.08682617,
      size.height,
      size.width * 0.1935488,
      size.height,
    );
    path_0.cubicTo(
      size.width * 0.3002715,
      size.height,
      size.width * 0.3870977,
      size.height * 0.9204102,
      size.width * 0.3870977,
      size.height * 0.8225801,
    );
    path_0.lineTo(size.width * 0.3870977, size.height * 0.6935469);
    path_0.lineTo(size.width * 0.3870977, size.height * 0.3800547);
    path_0.lineTo(size.width * 0.9032266, size.height * 0.2985605);
    path_0.lineTo(size.width * 0.9032266, size.height * 0.5645156);
    path_0.lineTo(size.width * 0.8064531, size.height * 0.5645156);
    path_0.cubicTo(
      size.width * 0.6997305,
      size.height * 0.5645156,
      size.width * 0.6129043,
      size.height * 0.6441055,
      size.width * 0.6129043,
      size.height * 0.7419355,
    );
    path_0.cubicTo(
      size.width * 0.6129043,
      size.height * 0.8397656,
      size.width * 0.6997305,
      size.height * 0.9193555,
      size.width * 0.8064531,
      size.height * 0.9193555,
    );
    path_0.cubicTo(
      size.width * 0.9131758,
      size.height * 0.9193555,
      size.width,
      size.height * 0.8397637,
      size.width,
      size.height * 0.7419355,
    );
    path_0.lineTo(size.width, size.height * 0.6129023);
    path_0.lineTo(size.width, size.height * 0.2419355);
    path_0.lineTo(size.width, size.height * 0.04838672);
    path_0.cubicTo(
      size.width,
      size.height * 0.03423633,
      size.width * 0.9938027,
      size.height * 0.02079297,
      size.width * 0.9830449,
      size.height * 0.01159961,
    );
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? const Color(0xff000000);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
