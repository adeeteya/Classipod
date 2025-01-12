import 'package:flutter/cupertino.dart';

class AppleCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(44.316406, 0);
    path_0.cubicTo(44.464844, 0, 44.613281, 0, 44.773438, 0);
    path_0.cubicTo(
      45.136719,
      4.511719,
      43.414062,
      7.886719,
      41.320312,
      10.328125,
    );
    path_0.cubicTo(
      39.265625,
      12.753906,
      36.453125,
      15.105469,
      31.902344,
      14.75,
    );
    path_0.cubicTo(
      31.597656,
      10.300781,
      33.324219,
      7.175781,
      35.414062,
      4.742188,
    );
    path_0.cubicTo(37.355469, 2.46875, 40.910156, 0.449219, 44.316406, 0);
    path_0.close();
    path_0.moveTo(44.316406, 0);

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color.fromRGBO(0, 0, 0, 1);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(58.089844, 46.976562);
    path_1.cubicTo(
      58.089844,
      47.023438,
      58.089844,
      47.0625,
      58.089844,
      47.105469,
    );
    path_1.cubicTo(56.8125, 50.976562, 54.988281, 54.296875, 52.761719, 57.375);
    path_1.cubicTo(
      50.730469,
      60.171875,
      48.238281,
      63.933594,
      43.792969,
      63.933594,
    );
    path_1.cubicTo(
      39.953125,
      63.933594,
      37.398438,
      61.464844,
      33.460938,
      61.398438,
    );
    path_1.cubicTo(29.296875, 61.332031, 27.007812, 63.464844, 23.199219, 64);
    path_1.cubicTo(22.765625, 64, 22.328125, 64, 21.902344, 64);
    path_1.cubicTo(
      19.105469,
      63.59375,
      16.847656,
      61.378906,
      15.203125,
      59.386719,
    );
    path_1.cubicTo(10.355469, 53.488281, 6.609375, 45.875, 5.914062, 36.128906);
    path_1.cubicTo(
      5.914062,
      35.171875,
      5.914062,
      34.21875,
      5.914062,
      33.261719,
    );
    path_1.cubicTo(
      6.207031,
      26.289062,
      9.597656,
      20.617188,
      14.101562,
      17.867188,
    );
    path_1.cubicTo(16.480469, 16.40625, 19.75, 15.160156, 23.386719, 15.71875);
    path_1.cubicTo(
      24.949219,
      15.960938,
      26.539062,
      16.492188,
      27.9375,
      17.023438,
    );
    path_1.cubicTo(
      29.261719,
      17.53125,
      30.917969,
      18.433594,
      32.484375,
      18.386719,
    );
    path_1.cubicTo(
      33.546875,
      18.355469,
      34.605469,
      17.800781,
      35.675781,
      17.410156,
    );
    path_1.cubicTo(
      38.8125,
      16.277344,
      41.886719,
      14.980469,
      45.9375,
      15.589844,
    );
    path_1.cubicTo(
      50.808594,
      16.324219,
      54.265625,
      18.488281,
      56.402344,
      21.828125,
    );
    path_1.cubicTo(
      52.28125,
      24.449219,
      49.023438,
      28.402344,
      49.582031,
      35.148438,
    );
    path_1.cubicTo(
      50.074219,
      41.277344,
      53.636719,
      44.863281,
      58.089844,
      46.976562,
    );
    path_1.close();
    path_1.moveTo(58.089844, 46.976562);

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color.fromRGBO(0, 0, 0, 1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
