import 'package:flutter/material.dart';
import 'package:proyecto_mvc/src/ui/widget/global/barraNavegacion.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: barraNavegacion(),
    );
  }
}

