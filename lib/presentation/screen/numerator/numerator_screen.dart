import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/numerator_provider.dart';
import 'package:flutter_application_1/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider de estado para el contador
final counterProvider = StateProvider<int>((ref) => 0);

class NumeratorScreen extends ConsumerWidget {
  const NumeratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickNumerator = ref.watch(numeratorProvider);

    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Numerator'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(estTenebrisModusProvider.notifier).update((state) => !state);
            },
            icon: Icon(estTenebrisModus ? Icons.dark_mode_outlined : Icons.light_mode_outlined),)
        ],
      ),
      body: Center(
        child: 
        Text('Valor: $clickNumerator',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(numeratorProvider.notifier).state++;
          ref.read(numeratorProvider.notifier).update((state)=>state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
class NumeratorScreen extends StatelessWidget {
  
  int counter = 0;

  NumeratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numerator'),
      ),
      body: Center(
        child: Text('Valor: $counter', style: Theme.of(context).textTheme.titleLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          print(counter);
        },
        child: Icon(Icons.add),
        ),
    );
  }
}
*/