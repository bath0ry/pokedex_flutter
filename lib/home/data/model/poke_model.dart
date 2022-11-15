// To parse this JSON data, do
//
//     final pokeModel = pokeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PokeModel pokeModelFromJson(String str) => PokeModel.fromJson(json.decode(str));

String pokeModelToJson(PokeModel data) => json.encode(data.toJson());

class PokeModel {
  PokeModel({
    required this.pokedex,
    required this.pokemon,
  });

  String pokedex;
  String pokemon;

  factory PokeModel.fromJson(Map<String, dynamic> json) => PokeModel(
        pokedex: json["pokedex"],
        pokemon: json["pokemon"],
      );

  Map<String, dynamic> toJson() => {
        "pokedex": pokedex,
        "pokemon": pokemon,
      };
}
