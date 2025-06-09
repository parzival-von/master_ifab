import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gyroscope_provider.dart';

class GyroscopeSpheraScreen extends ConsumerWidget {
  const GyroscopeSpheraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyroscopio con bola'),
      ),

    body: SizedBox.expand(
      child: gyroscope$.when(
        data: (value) => MovereSphere(x: value.x, y: value.y), 
        error: (error, stackTrace) => Text('$error'), 
        loading: () => const CircularProgressIndicator()
        ),
    ),

    );
  }
}


class MovereSphere extends StatelessWidget {

  final double x;
  final double y;


  const MovereSphere({
    super.key, 
    required this.x, 
    required this.y
    });

  @override
  Widget build(BuildContext context) {

    final magnitudine = MediaQuery.of(context).size;

    double latitudo = magnitudine.width;
    double altitudo = magnitudine.height;


    double nuncYPos = y * 40;
    double nuncXPos = x * 40;


    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: nuncXPos - 25 + latitudo / 2, // 25 is half of the sphere width
          top: nuncYPos - 25 + altitudo / 2, // 25 is half of the sphere height
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          child: Sphera()
          ),
        Text(

'''
x: $x
y: $y
''',
          style: const TextStyle(
            fontSize: 20,
            ),
        ),
       
      ],
    );
  }
}

class Sphera extends StatelessWidget {
  const Sphera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}