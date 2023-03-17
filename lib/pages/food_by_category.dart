import 'package:flutter/material.dart';
import 'package:food_api/providers/food_provider.dart';
import 'package:food_api/models/food_model.dart';

class FoodByCategory extends StatelessWidget {
  const FoodByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final String category =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: FoodProvider().getFoodByCategory(category),
          builder: (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    title: Text(snapshot.data![index].name!),
                    leading: Image.network(snapshot.data![index].image!),
                    onTap: () {
                      print(snapshot.data![index].idMeal);
                      Navigator.pushNamed(context, 'food_details',
                          arguments: snapshot.data![index].idMeal);
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
