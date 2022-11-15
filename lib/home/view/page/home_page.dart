import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/home/data/model/poke_model.dart';
import 'package:pokedex_app/home/data/service/poke_service.dart';

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
      body: PokeWidget(
        service: service,
      ),
    );
  }
}

class PokeWidget extends StatelessWidget {
  const PokeWidget({
    Key? key,
    required this.service,
  }) : super(key: key);

  final PokeService service;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: PokeModel(pokemon: '', pokedex: ''),
      future: service.getPokemon(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Erro ao achar"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<PokeModel> data = snapshot.data as List<PokeModel>;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(children: [Text(data[index].pokemon)]);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
