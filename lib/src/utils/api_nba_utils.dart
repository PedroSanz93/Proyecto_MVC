/*

import 'package:proyecto_mvc/src/utils/APIutils.dart';

class NBAStatsAPI {
  final String apiKey = '1aaad60e2bcc1ff0825c6c767cdf34b7';

  Future<Map<String, dynamic>?> getGames(String date) async {
    var apiUrl = 'https://v2.nba.api-sports.io'; 
    var queryParams = {'date': date}; 
    var queryString = Uri(queryParameters: queryParams).query;
    var apiUrlWithParams = '$apiUrl?$queryString';
    var api = APIUtils(apiUrlWithParams, headers: {
      'X-RapidAPI-Key': apiKey,
    });

    return await api.call();
  }
}
*/