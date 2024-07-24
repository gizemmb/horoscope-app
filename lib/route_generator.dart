import 'package:flutter/material.dart';
import 'package:burc_app/burc_detay.dart';
import 'package:burc_app/burclistesi.dart';
import 'model/burc.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BurcListesi(),
        );

      case '/burcDetay':
        final Burc secilenBurc = settings.arguments as Burc;
        return MaterialPageRoute(
          builder: (context) => BurcDetay(secilenBurc: secilenBurc),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Hata')),
        body: const Center(
          child: Text('Bu sayfa mevcut değil!'),
        ),
      ),
    );
  }
}
