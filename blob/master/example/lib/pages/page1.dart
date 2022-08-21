import 'package:flutter/material.dart';
import 'package:route_transitions_easy/route_transitions_easy.dart';

import 'package:crear_paquetes/pages/pages.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
            color: Colors.white,
            onPressed: () {
              RouteTransitionsEasy(
                context: context,
                child: const Page2(),
                animation: AnimationType.fadeIn,
                duration: const Duration(milliseconds: 900),
                // replacement: true
              );
            },
            child: const Text('Route to Page2')),
      ),
    );
  }
}
