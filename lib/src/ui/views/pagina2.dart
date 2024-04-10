import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final GlobalKey<FormState> _formularioEstado = GlobalKey<FormState>();
  DateTime? _date;

  String display() {
    if (_date == null) {
      return 'NONE';
    } else {
      return 'year:${_date!.year}\nmonth:${_date!.month}\nday:${_date!.day}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _formularioEstado,
              child: ListView(
                children: [
                  //CAMPO APELLIDO 1
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: const Text("Formulario de contacto")),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: const Center(
                      child: Icon(Icons.person),
                    ),
                  ),
                  //CAMPO NOMBRE
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.greenAccent),
                    ),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\d'))
                      ],
                      maxLength: 25,
                      decoration: const InputDecoration(
                          hintText: "Nombre", 
                          border: InputBorder.none,
                          counterText: '',),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                  ),
                  //CAMPO APELLIDO 1
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.greenAccent),
                    ),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\d'))
                      ],
                      maxLength: 25,
                      decoration: const InputDecoration(
                          hintText: "Primer apellido", 
                          border: InputBorder.none,
                          counterText: '',
                          ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                  ),
                  //CAMPO APELLIDO 2
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.greenAccent),
                    ),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\d'))
                      ],
                      maxLength: 25,
                      decoration: const InputDecoration(
                          hintText: "Segundo apellido", 
                          border: InputBorder.none,
                          counterText: ''),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: const Center(
                      child: Icon(Icons.phone),
                    ),
                  ),
                  //TELEFONO DE CONTACTO
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.greenAccent),
                    ),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                      ],
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      decoration: const InputDecoration(
                          hintText: "Telefono de contacto", 
                          border: InputBorder.none,
                          counterText: '',
                          ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                  ),
                  //FECHA DE NACIMIENTO
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.greenAccent),
                    ),
                    child: DateFormatField( 
                      decoration: const InputDecoration(
                          hintText: "Fecha de nacimiento", 
                          border: InputBorder.none,
                          ),
                      onComplete: (date) {
                        setState(() {
                          _date = date;
                        });
                      },
                      addCalendar: true,
                      type: DateFormatType.type2
                      ),
                      
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Enviar"),
                    ),
                  )
                ],
              ),
            
          )
        );
  }
}
