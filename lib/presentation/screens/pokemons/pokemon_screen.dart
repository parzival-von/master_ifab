import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_ifab/config/config.dart';
import 'package:master_ifab/presentation/providers/provaiders.dart';

class PokemonScreen extends ConsumerWidget {

  final String pokemonId;

  const PokemonScreen({

    required this.pokemonId,
    super.key
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

final pokemonAsync = ref.watch(pokemonProviders(pokemonId));

    return pokemonAsync.when(
      data:(pokemon) => _PokemonVisum(pokemon: pokemon), 
      error:(error, stackTrace) => _ErrorWidget(
        nuntius: error.toString(),
      ),
      loading:() => const _loadingWidget(),
      );
  }
}

class _PokemonVisum extends StatelessWidget {

  final Pokemon pokemon;

  const _PokemonVisum({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              // Aquí puedes agregar la lógica para marcar como favorito
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          Column( children: [
            Text('Sus habilidades son:', style: TextStyle(fontSize: 20),),
            Text(pokemon.facultates.join(", "), style: TextStyle(fontSize: 15),),
          ],),

          Image.network(
            pokemon.faciemImaginem ?? "",
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 15,),
          Text('Mide: ${pokemon.altitudo} m y pesa ${pokemon.pondus} kg', 
          style: TextStyle(fontSize: 20),),
        ],
      ),),
    );
  }
}

class _ErrorWidget extends StatelessWidget {

final String nuntius;

  const _ErrorWidget({
    required this.nuntius,
    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(nuntius),
      ),
    );
  }
}



class _loadingWidget extends StatelessWidget {
  const _loadingWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator() ,),
    );
  }
}