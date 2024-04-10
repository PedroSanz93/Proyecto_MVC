import 'package:flutter/material.dart';
import 'package:proyecto_mvc/src/utils/APIutils.dart';

class ApiWordpress extends StatefulWidget {
  const ApiWordpress({Key? key}) : super(key: key);

  @override
  _ApiWordpressState createState() => _ApiWordpressState();
}

class SpoonacularAPI {
  static const String apiKey = '9ddc61b524c84a40849991728b129e89';
  static const String baseUrl = 'https://api.spoonacular.com/';

  // Método para realizar una búsqueda compleja de recetas
  static Future<Map<String, dynamic>?> searchRecipes({required Map<String, dynamic> query}) async {
    final url = '${baseUrl}recipes/complexSearch?apiKey=$apiKey';
    final apiUtils = APIUtils(url, 
    method: 'GET', 
    headers: {'Content-Type': 'application/json'}, 
    data: query);

    return await apiUtils.call();
  }
}

class _ApiWordpressState extends State<ApiWordpress> {
  Future<List<dynamic>?>? _futureRecipes;

  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener datos de la API al iniciar el widget
    _futureRecipes = _fetchRecipes();
  }

  Future<List<dynamic>?> _fetchRecipes() async {
    // Realizar la llamada a la API y devolver la lista de recetas
    final query = {
      'query': 'chicken',
      'maxReadyTime': 20,
      'number': 5,
    };
    final recipesResponse = await SpoonacularAPI.searchRecipes(query: query);
    if (recipesResponse != null) {
      return recipesResponse['results'];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas de Spoonacular'),
      ),
      body: FutureBuilder<List<dynamic>?>(
        future: _futureRecipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return ListTile(
                  title: Text(recipe['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tiempo de preparación: ${recipe['readyInMinutes']} minutos'),
                      if (recipe['cuisines'] != null)
                        Text('Cocina: ${recipe['cuisines'].join(', ')}'),
                      if (recipe['diets'] != null)
                        Text('Dietas: ${recipe['diets'].join(', ')}'),
                      if (recipe['dishTypes'] != null)
                        Text('Tipos de plato: ${recipe['dishTypes'].join(', ')}'),
                    ],
                  ),
                  onTap: () {
                    // Aquí puedes añadir la acción al tocar la receta si es necesario
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No se encontraron recetas.'));
          }
        },
      ),
    );
  }
}
