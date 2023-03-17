import 'package:flutter/material.dart';
import 'package:food_api/pages/areas_pages.dart';
import 'package:food_api/pages/categories.dart';
import 'package:food_api/pages/food_by_area.dart';
import 'package:food_api/pages/food_by_category.dart';
import 'package:food_api/pages/food_details.dart';
import 'package:food_api/pages/home_page.dart';
import 'package:food_api/providers/food_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FoodProvider().getRandomFood();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'foodDetails': (BuildContext context) => FoodDetails(),
        'food_by_area': (BuildContext context) => FoodByArea(),
        'food_by_category': (BuildContext context) => FoodByCategory(),
      },
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Food API'),
            //color rojo
            backgroundColor: Colors.red,

            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Inicio',
                ),
                Tab(
                  icon: Icon(Icons.restaurant),
                  text: 'Ingredientes',
                ),
                Tab(
                  icon: Icon(Icons.map),
                  text: 'Zonas',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [HomePage(), CategoryPage(), AreasPage()],
          ),
        ),
      ),
    );
  }
}
