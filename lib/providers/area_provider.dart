import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food_api/models/area_model.dart';

class AreaProvider {
  final url = 'https://www.themealdb.com/api/json/v1/1/list.php?a=list';

  Future<List<Area>> getAreas() async {
    final resp = await http.get(Uri.parse(url));
    final decodedData = json.decode(resp.body);
    final areas = Areas.fromJsonList(decodedData['meals']);
    return areas.items;
  }
}
