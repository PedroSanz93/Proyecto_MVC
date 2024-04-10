import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class ImagenesScreen extends StatefulWidget {
  const ImagenesScreen({super.key});

  @override
  State<ImagenesScreen> createState() => _ImagenesScreenState();
}

class _ImagenesScreenState extends State<ImagenesScreen> {

// ESTO VA EN IMAGES
  List<String> images = [
"https://dam.ngenespanol.com/wp-content/uploads/2021/02/GettyImages-1033902830.jpg",
"https://cdn.pixabay.com/photo/2017/07/24/19/57/tiger-2535888_640.jpg",
"https://img.freepik.com/foto-gratis/vista-lince-salvaje-naturaleza_23-2150779306.jpg",
"https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg",
"https://www.selwo.es/content/dam/swa/images/descubre-el-zoo/especies-y-territorios/animales/panda-rojo/Panda-rojo-Selwo-Aventura-13.jpg",
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria de imagenes',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Galeria de imagenes'),
        ),
        body: Column(
          children: [
            Container(
            child: _swiper(),
          ),
          SizedBox(
            height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text("volver")
            ),
        ],
      ), 
    ),
  );
}

  Widget _swiper() {
    return Container(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (
          BuildContext context,
          int index){
          return new Image.network(
            images[index], 
            fit: BoxFit.fill,);
        },
        itemCount: images.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}