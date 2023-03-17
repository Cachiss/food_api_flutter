import 'package:flutter/material.dart';

class Food {
  String? name;
  String? description;
  String? image;
  String? idMeal;
  String? strMeal;
  String? strMealThumb;
  String? strInstructions;
  String? strCategory;
  String? strArea;
  String? strTags;
  String? strYoutube;

  Food({
    this.name,
    this.description,
    this.image,
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
    this.strInstructions,
    this.strCategory,
    this.strArea,
    this.strTags,
    this.strYoutube,
  });

  //factory is used to return an instance of the class
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      idMeal: json['idMeal'],
      name: json['strMeal'],
      description: json['strInstructions'],
      image: json['strMealThumb'],
    );
  }

  void setData() {}
}

class Foods {
  List<Food> items = [];

  Foods.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final food = Food.fromJson(item);
      items.add(food);
    });
  }
}

final foodP = Food();
