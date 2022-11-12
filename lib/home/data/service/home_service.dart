import 'package:dio/dio.dart';
import 'package:pokedex_app/home/data/model/home_model.dart';

class PokeService {
  PokeService(this.dio);

  final Dio dio;

  Future<ModelPoke> getModelPoke() async {
    const url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/";

    try {
      final response = await dio.get(url);
      return ModelPoke.fromJson(response.data);
    } catch (e) {
      throw Exception("Erro ao pegar pokedex");
    }
  }
}
