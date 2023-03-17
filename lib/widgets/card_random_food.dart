import 'package:flutter/material.dart';

import 'package:food_api/providers/food_provider.dart';

import 'package:food_api/models/food_model.dart';

class CardFoodRandom extends StatelessWidget {
  const CardFoodRandom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      child: FutureBuilder(
        future: FoodProvider().getRandomFood(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(snapshot.data.image,
                        width: MediaQuery.of(context).size.width, height: 300),
                    const SizedBox(height: 10),
                    Text(snapshot.data.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(snapshot.data.description,
                        textAlign: TextAlign.justify),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
