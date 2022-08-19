import 'package:flutter/material.dart';


enum AnimationType {
  normal,
  fadeIn
} 

class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final Duration duration;
  final AnimationType animation;
  final bool replacement;

  RouteTransitions({
    required this.context, 
    required this.child,
    duration, 
    animation,
    replacement
  }): animation = animation ?? AnimationType.normal,
      duration = duration ?? const Duration(milliseconds: 300),
      replacement = replacement ?? false 
  {

    // hacemos un switch
    switch( this.animation ){
      case AnimationType.normal: 
        this._normalTrasition();
        break;
      case AnimationType.fadeIn:
        this._fadeInTransition();
        break;
    } 


  }

  void _pushPage( Route route ) => Navigator.push(context, route);
  void _pushReplacementPage( Route route ) => Navigator.pushReplacement(context, route);

  void _normalTrasition() {
    final route = MaterialPageRoute(builder: (_) => child); 
    // verifica que sea replacement o no
    replacement 
      ? _pushReplacementPage(route)
      : _pushPage(route); 
  }

  void _fadeInTransition() {

    final route = PageRouteBuilder(
      pageBuilder: ( _ , __ , ___ ) => child,
      transitionDuration: duration,
      transitionsBuilder: ( _ , animation, __ , child ) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation( parent: animation, curve: Curves.easeOut )
          ),
          child: child
        );
      }
    ); 
    
    // verifica que sea replacement o no
    replacement 
      ? _pushReplacementPage(route)
      : _pushPage(route);

  }

}