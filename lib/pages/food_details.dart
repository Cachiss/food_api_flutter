import 'package:flutter/material.dart';
import 'package:food_api/providers/food_provider.dart';
import 'package:food_api/models/food_model.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final Food? food = ModalRoute.of(context)!.settings.arguments as Food?;
    return Scaffold(
        appBar: AppBar(
          title: Text(food!.name!, textAlign: TextAlign.center),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(food.image!),
                    const SizedBox(height: 10),
                    Text(food.name!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(food.description!),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
