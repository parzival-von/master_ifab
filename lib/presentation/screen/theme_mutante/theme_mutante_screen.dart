import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeMutanteScreen extends ConsumerWidget {
  const ThemeMutanteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Mutante'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(estTenebrisModusProvider.notifier).update((state) => !state);
            },
            icon: Icon(estTenebrisModus ? Icons.dark_mode_outlined : Icons.light_mode_outlined),)
        ],
      ),
      body:  _ThemeMutanteVisum(),
    );
  }
}

class _ThemeMutanteVisum extends ConsumerWidget {
  const _ThemeMutanteVisum();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colorum = ref.watch(colorumIndexProvider); 

    final int electusColor = ref.watch(electusColorProvider);

    return ListView.builder(
      itemCount: colorum.length,
      itemBuilder:(context, index) {
        final Color color = colorum[index];
        return RadioListTile(
          title: Text('Este color ', style: TextStyle(color:color, fontWeight: FontWeight.w800),),
          subtitle: Text('${color.hashCode}'),
          activeColor: color,
          value: index,
          groupValue: electusColor,
          onChanged:(value) {
            ref.read(electusColorProvider.notifier).state  = index;
            
          },);
      },
    );
  }
}