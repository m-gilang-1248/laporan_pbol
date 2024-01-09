import 'package:flutter/material.dart';
import 'screen.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('Error Page')),
      );
    });
  }
}