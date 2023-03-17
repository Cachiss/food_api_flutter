import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:food_api/models/food_model.dart';

class FoodProvider {
  final String _url = 'www.themealdb.com';

  Future<List<Food>> getFoods() async {
    final url = Uri.https(_url, 'api/json/v1/1/search.php', {'s': 'a'});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final foods = new Foods.fromJsonList(decodedData['meals']);
    return foods.items;
  }

  //get random food
  Future<Food> getRandomFood() async {
    final url = Uri.parse("https://www.themealdb.com/api/json/v1/1/random.php");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Food.fromJson(data['meals'][0]);
    } else {
      throw Exception('FALLÓ LA CONEXIÓN');
    }
  }

  Future<List<dynamic>> getFoodById(String id) async {
    final url = Uri.https(_url, 'api/json/v1/1/lookup.php', {'i': id});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final foods = new Foods.fromJsonList(decodedData['meals']);
    print(foods.items[0].strMeal);
    return foods.items;
  }

  //por area
  Future<List<Food>> getFoodByArea(String area) async {
    final url = Uri.https(_url, 'api/json/v1/1/filter.php', {'a': area});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final foods = new Foods.fromJsonList(decodedData['meals']);
    return foods.items;
  }

  //por categoria
  Future<List<Food>> getFoodByCategory(String category) async {
    final url = Uri.https(_url, 'api/json/v1/1/filter.php', {'c': category});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final foods = new Foods.fromJsonList(decodedData['meals']);
    return foods.items;
  }
}
