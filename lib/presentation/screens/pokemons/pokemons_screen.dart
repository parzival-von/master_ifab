import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:master_ifab/presentation/providers/provaiders.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PokemonsVisum(),
    );
  }
}

class PokemonsVisum extends ConsumerStatefulWidget {
  const PokemonsVisum({super.key});

  @override
  PokemonsVisumState createState() => PokemonsVisumState();
}

class PokemonsVisumState extends ConsumerState<PokemonsVisum> {

  bool oneratusEst = false;

  final scrollController = ScrollController();
  @override
  void initState() {
    
    scrollController.addListener(() {
      if (scrollController.position.pixels + 200 > scrollController.position.maxScrollExtent - 100) {
        vadeProximamPagina();
      }
    });
    super.initState();
  }

@override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Theme.of(context).secondaryHeaderColor.withValues(alpha: 0.5),
        ),

        _PokemonGrid()
      ],
    );
  }


  Future vadeProximamPagina() async{

    if (oneratusEst) return; // Prevent multiple calls
    oneratusEst = true; // Set the flag to true to prevent further calls

    await Future.delayed(const Duration(seconds: 2));
    
    ref.read(pokemonsIdsProviders.notifier).update((state) =>[
      ...state,
      ...List.generate(30, (index) => state.length + index + 1)
    ]);
    oneratusEst = false;
    movereScrollAsdDescendit(); // Reset the flag after the operation is complete
  }

void movereScrollAsdDescendit(){
  if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent)return;
  scrollController.animateTo(
    scrollController.position.pixels + 200,
    duration: const Duration(milliseconds: 300),
    curve: Curves.fastOutSlowIn,
  );
}

}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonsIds = ref.watch(pokemonsIdsProviders);

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
      (crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push('/request/${index+1}'); // Navigate to the Pokemon screen with the index as ID
          },
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemonsIds[index]}.png',
            fit: BoxFit.contain,
          ),
        );
      },
      itemCount: pokemonsIds.length,
    );
  }
}