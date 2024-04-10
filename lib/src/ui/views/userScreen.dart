import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USUARIO'),
      ),
      body: Column(
        children: [
          // BOTON PARA MOVERTE DE LA PESTAÑA LATERAL USUARIO A LA PAGINA 1 DEL HOME
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/pagina1');
            },
            child: Text('Ir a la página 1'),
          ),
        ],
      ),
    );
  }
}
