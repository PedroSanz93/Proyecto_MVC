
import 'package:flutter/material.dart';
import 'package:proyecto_mvc/src/config/routes/import.dart';
import 'package:proyecto_mvc/src/config/routes/routes.dart';

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: Routes.routes,
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (context) => const Screen404()
          );
      },
    );
  }
}