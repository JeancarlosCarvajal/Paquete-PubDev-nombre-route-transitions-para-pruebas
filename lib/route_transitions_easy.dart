import 'package:flutter/material.dart';

enum AnimationType { normal, fadeIn }

class RouteTransitionsEasy {
  final BuildContext context;
  final Widget child;
  final Duration duration;
  final AnimationType animation;
  final bool replacement;

  RouteTransitionsEasy(
      {required this.context,
      required this.child,
      duration,
      animation,
      replacement})
      : animation = animation ?? AnimationType.normal,
        duration = duration ?? const Duration(milliseconds: 300),
        replacement = replacement ?? false {
    switch (this.animation) {
      case AnimationType.normal:
        _normalTrasition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }

  void _pushPage(Route route) => Navigator.push(context, route);
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  void _normalTrasition() {
    final route = MaterialPageRoute(builder: (_) => child);

    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }

  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (_, __, ___) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut)),
              child: child);
        });

    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }
}
