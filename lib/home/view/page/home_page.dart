import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/home/data/model/home_model.dart';
import 'package:pokedex_app/home/data/service/home_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PokeService service;

  @override
  void initState() {
    service = PokeService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: FutureBuilder(
        initialData: ModelPoke(pokemon: []),
        future: service.getModelPoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao achar"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            ModelPoke data = snapshot.data as ModelPoke;

            return ListView.builder(
              itemCount: data.pokemon.length,
              itemBuilder: (context, index) {
                Pokemon pokemon = data.pokemon[index];
                return Column(
                  children: [
                    Text(pokemon.name),
                  ],
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
