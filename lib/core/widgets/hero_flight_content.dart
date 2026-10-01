import 'package:flutter/widgets.dart';

class HeroFlightContent extends StatelessWidget {
  const HeroFlightContent({
    super.key,
    required this.child,
    required this.flightBuilder,
  });

  final Widget child;
  final WidgetBuilder flightBuilder;

  static Widget preview(BuildContext heroContext) {
    final hero = heroContext.widget as Hero;
    final content = hero.child;
    return content is HeroFlightContent
        ? content.flightBuilder(heroContext)
        : hero;
  }

  @override
  Widget build(BuildContext context) => child;
}
