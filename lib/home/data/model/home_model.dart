// To parse this JSON data, do
//
//     final modelPoke = modelPokeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ModelPoke {
  ModelPoke({
    required this.pokemon,
  });

  final List<Pokemon> pokemon;

  factory ModelPoke.fromJson(Map<String, dynamic> json) => ModelPoke(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );
}

class Pokemon {
  Pokemon({
    required this.name,
    required this.img,
  });

  final String name;
  final String img;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        img: json["img"],
      );
}
