import 'package:dio/dio.dart';
import 'package:pokedex_app/home/data/model/poke_model.dart';

class PokeService {
  PokeService(this.dio);

  final Dio dio;

  Future<List<PokeModel>> getPokemon() async {
    const url = "https://pokeapi.co/api/v2/pokemon/clefairy";

    try {
      final response = await dio.get(url);
      final data = List<PokeModel>.from(
        response.data.map(
          (e) => PokeModel.fromJson(e),
        ),
      ).toList();
      return data;
    } catch (e) {
      throw Exception("Erro ao pegar pokedex");
    }
  }
}
