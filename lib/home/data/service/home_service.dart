import 'package:dio/dio.dart';
import 'package:pokedex_app/home/data/model/home_model.dart';

class PokeService {
  PokeService(this.dio);
  final Dio dio;
  Future<PokeModel> getPokeModel() async {
    const url = 'https://pokeapi.co/api/v2/pokemon';
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon');
      return PokeModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erro ao pegar dados');
    }
  }
}
