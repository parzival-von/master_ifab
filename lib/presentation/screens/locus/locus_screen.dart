import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_ifab/presentation/providers/provaiders.dart';


class LocusScreen extends ConsumerWidget {
  const LocusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userLocusAsync = ref.watch(userLocureProvider);
    final vigiliaLocusAsync = ref.watch(vigiliaLocureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Localización'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              spacing: 15,
              children: [
                Text('ubicación', 
                style: TextStyle(
                  fontSize: 35, 
                  color: Colors.grey
                  ),),
                  
                  userLocusAsync.when(
                    data: (data) => Text('$data', style: TextStyle(fontSize: 25),), 
                    error: (error, stack) => Text('Error: $error', style: TextStyle(fontSize: 25, color: Colors.red),),
                    loading: () => CircularProgressIndicator(),
                    )
              ],
            ),

            Column(
              spacing: 15,
              children: [
                Text('Seguimineto', 
                style: TextStyle(
                  fontSize: 35, 
                  color: Colors.grey
                  ),),
                  vigiliaLocusAsync.when(
                    data: (data) => Text('$data', style: TextStyle(fontSize: 25),), 
                    error: (error, stack) => Text('Error: $error', style: TextStyle(fontSize: 25, color: Colors.red),),
                    loading: () => CircularProgressIndicator(),
                    )
              ],

            )
          ],
        ),
        ),
    );
  }
}