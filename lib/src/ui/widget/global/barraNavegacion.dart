
import 'package:flutter/material.dart';
import 'package:proyecto_mvc/src/config/routes/import.dart';
import 'package:proyecto_mvc/src/ui/widget/global/barraLateral.dart';

class barraNavegacion extends StatelessWidget {
  const barraNavegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 202, 130),
          title: const Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
                ),
              ),
            bottom: const TabBar(
              tabs: [
              Tab(
                icon: Icon(
                  Icons.directions_car,
                  color: Colors.white,),
              ),
              Tab(
                icon: Icon(
                  Icons.verified_user,
                  color: Colors.white,),
              ),
              Tab(
                icon: Icon(
                  Icons.directions_bike,
                  color: Colors.white,),
              )
            ],
          ),
        ),
      drawer: const BarraLateral(),
      backgroundColor: const Color.fromARGB(137, 157, 253, 225),
      body: TabBarView(
            children: [
              Pagina1(),
              Pagina2(),
              Pagina3()
          ],
        ),
      
    );
  }
}