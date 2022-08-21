import 'package:flutter/material.dart';

/// Animation Types
enum AnimationType { normal, fadeIn }

/// [context] is the BuildContext
/// [child] is the Next widget to go
/// [duration] is the duration of the fadeIn animation
/// [animation] is the animation selected, just fadeIn and normal
/// [replacement] indicates if the next page will have the go back option
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
    /// Verifies which animation is selected
    switch (this.animation) {
      case AnimationType.normal:
        _normalTrasition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }

  /// This is called when the replacement is true, it provides a go back page
  void _pushPage(Route route) => Navigator.push(context, route);

  /// This is called when the replacement is false (default), it do not provide a go back page
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  /// This is called when the transition is no specified, make a normal transition page whitout animation
  void _normalTrasition() {
    final route = MaterialPageRoute(builder: (_) => child);

    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }

  /// This is called when a transition fadiIn is selected
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
