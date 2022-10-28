// To parse this JSON data, do
//
//     final modelPoke = modelPokeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelPoke modelPokeFromJson(String str) => ModelPoke.fromJson(json.decode(str));

String modelPokeToJson(ModelPoke data) => json.encode(data.toJson());

class ModelPoke {
  ModelPoke({
    required this.pokemon,
  });

  final List<Pokemon> pokemon;

  factory ModelPoke.fromJson(Map<String, dynamic> json) => ModelPoke(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}

class Pokemon {
  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.height,
    required this.weight,
  });

  final int id;
  final String num;
  final String name;
  final String img;

  final String height;
  final String weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        height: json["height"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "height": height,
        "weight": weight,
      };
}
