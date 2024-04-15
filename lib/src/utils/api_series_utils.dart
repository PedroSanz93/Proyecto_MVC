import 'package:http/http.dart' as http;
import 'package:proyecto_mvc/src/utils/APIutils.dart';

class APISeriesUtils{
  final String baseSeriesUrl = 'https://rickandmortyapi.com/api';

  Future<http.Response?> call(
    String apiUrl, 
    String method, 
    {Map<String, dynamic>? data}) async{

      try{
        var apiUtils = APIUtils(
          url: apiUrl, 
          method: method,
          data: data);
          return await apiUtils.call();
      } catch (e){
        print('Error al realizar la consulta: $e');
        return null;
      }
  }

  //Future<http.Response?> get  CONTINUAR EN OTRO MOMENTO

}