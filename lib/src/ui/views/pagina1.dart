import 'package:flutter/material.dart';
import 'package:proyecto_mvc/src/repository/local/imagenes_data.dart';
import 'package:proyecto_mvc/src/ui/widget/global/panelDesplegable.dart';
import 'package:url_launcher/url_launcher.dart';

class Pagina1 extends StatefulWidget {
  const Pagina1({Key? key}) : super(key: key);

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          final imageData = images[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(
                    imageData.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    imageData.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showPanel(context, imageData.mapsUrl);
                  },
                  child: Text('Ver en Google Maps'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showPanel(BuildContext context, String mapsUrl) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CustomSlidingPanel( 
          panel: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            
            height: 300,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Aqui para mostrar el mapa de Google Maps'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _launchMapsUrl(mapsUrl);
                  },
                  child: Text('Abrir en Google Maps'),
                ),
              ],
            ),
          ),
          body: Container(
          ), 
          minHeight: 50, 
          maxHeight: MediaQuery.of(context).size.height * 0.8, 
        );
      },
    );
  }

  void _launchMapsUrl(String mapsUrl) async {
    try {
      await launch(mapsUrl);
    } catch (e) {
      print('Error al abrir el enlace: $e');
    }
  }
}

