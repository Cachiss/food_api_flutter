import 'package:flutter/material.dart';
import 'package:food_api/providers/food_provider.dart';
import 'package:food_api/models/food_model.dart';
import 'package:food_api/widgets/card_random_food.dart';
import 'package:food_api/widgets/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              '¿Buscas algo nuevo?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardFoodRandom(),
            //a card that shows a random food
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Explora más comidas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: FoodProvider().getFoods(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
                if (snapshot.hasData) {
                  return CarouselWidget(foods: snapshot.data!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
