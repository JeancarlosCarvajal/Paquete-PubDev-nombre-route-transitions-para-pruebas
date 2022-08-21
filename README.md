<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

<!-- Put a short description of the package here that helps potential users
know whether this package might be useful for them. -->
This package is designed to make an Easy and Elegant Page Transition applying "easeOut" 
Animation just for testing and educational purpose

## Features

<!-- List what your package can do. Maybe include images, gifs, or videos. -->
This package can make an Easy and Elegant Page Transition applying "easeOut" 
Animation or a normal next page using clean code.

## Getting started

<!-- List prerequisites and provide or point to information on how to
start using the package. -->
Just use the default constructor of RouteTransitionsEasy.
1) "context" (BuildContext) and "child" (Widget to Go next) are required.
2) "animation" by defoult is "normal" another option is fadeIn (easeOut).
3) "duration" by default is 300 milliseconds and only works if fadeIn is selected.
4) "replacement" by default is false, this feature establish if the next page could go back clicking the arrow Back.

## Usage

<!-- Include short and useful examples for package users. Add longer examples
to `/example` folder.  -->
```dart
  RouteTransitionsEasy(
    context: context,
    child: const Page2(),
    animation: AnimationType.fadeIn,
    duration: const Duration(milliseconds: 500),
    replacement: true
  );
```

## Additional information

<!-- Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more. -->
Easy Page Transition applying "easeOut" Animation is created just for testing and educational purpose, 
but you could use it for any project that you desire, this is simple but powerfull package.