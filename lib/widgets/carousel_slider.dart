import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_api/models/food_model.dart';

//the slider receives a list

class CarouselWidget extends StatelessWidget {
  final List<Food> foods;
  CarouselWidget({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: foods.map((Food food) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: GestureDetector(
                  onTap: () {
                    print(food.idMeal);
                    Navigator.pushNamed(context, 'foodDetails',
                        arguments: food);
                  },
                  child: Stack(
                    //text and image
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          //que la imagen se adapte al tamaño del container
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: Image.network(
                            food.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.black.withOpacity(0.5),
                          child: Text(
                            food.name!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
