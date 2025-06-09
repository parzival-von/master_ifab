import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_ifab/presentation/providers/provaiders.dart';

class ThemeMutanteScreen extends ConsumerWidget {
  const ThemeMutanteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme mutante'),
         actions: [
          IconButton(
            onPressed: (){

              ref.read(estTenebrisModusProvider.notifier)
              .update((statumTheme) => !statumTheme);

            }, 
            icon: Icon( estTenebrisModus 
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined
            )
            )
        ],
      ),
      body: _ThemeMotanteVisum(),
    );
  }
}

class _ThemeMotanteVisum extends ConsumerWidget {
  const _ThemeMotanteVisum();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colorum = ref.watch(colorumIndexProvider);
    final electusColor = ref.watch(electurColorProvider);

    return ListView.builder(
      itemCount: colorum.length,
      itemBuilder: (context, index) {
        final Color color = colorum[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('#${color.hashCode}'),
          activeColor: color,
          value: index, 
          groupValue: electusColor, 
          onChanged:(value) {
            ref.read(electurColorProvider.notifier).state = index;
          },
          
          );
      },
    );
  }
}