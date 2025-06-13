import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:master_ifab/presentation/providers/provaiders.dart';
 
 
class CalceusPraevidere extends StatelessWidget {

final bool screenCompletaEst;


  const CalceusPraevidere({
    
    this.screenCompletaEst = false,
    super.key});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push('/shoes-desc');
      },

      child: Padding(
  padding: EdgeInsets.symmetric( 
    horizontal: screenCompletaEst ? 5 : 30,
    vertical: screenCompletaEst ? 5 : 0,
  ),
        child: Container(
          width: double.infinity,
          height: screenCompletaEst ? 410 : 440,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 207, 83),
            borderRadius: BorderRadius.circular(50)
          ),
          child: Column(
            children: [
              _CalceusCumUmbra(),
             if(!screenCompletaEst) const _CalceusMenserae()
            ],
          ),
        ),
      ),
    );
  }
}
 
 
class _CalceusCumUmbra extends ConsumerWidget {
 
  const _CalceusCumUmbra();
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final calceusState = ref.watch(calceusProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Stack(
        children: [
          Positioned(bottom: 10, right: 0, child: _UmbraProjecta()),
          Image(image: AssetImage(calceusState.assetImago), width: 320, height: 320, fit: BoxFit.cover,)
        ],
      ),
    );
  }
}
 
 
class _UmbraProjecta extends StatelessWidget {
 
  const _UmbraProjecta();
 
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(254, 234, 161, 78), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}
 
 
class _CalceusMenserae extends StatelessWidget {
 
  const _CalceusMenserae();
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _HaecMensura(numerus: 7),
          _HaecMensura(numerus: 7.5),
          _HaecMensura(numerus: 8),
          _HaecMensura(numerus: 8.5),
          _HaecMensura(numerus: 9),
          _HaecMensura(numerus: 9.5),
        ],
      ),
    );
  }
}
 
class _HaecMensura extends ConsumerWidget {
 
  final double numerus;
 
  const _HaecMensura({
    required this.numerus
  });
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CalceusState =  ref.watch(calceusProvider);

    return GestureDetector(
      onTap: () {
        ref.read(calceusProvider.notifier).ponereMesura(numerus);
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: numerus == CalceusState.mensura ? Color.fromARGB(255, 241, 162, 58) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: numerus == CalceusState.mensura ? Color.fromARGB(255, 226, 106, 42) : Color.fromARGB(255, 241, 162, 58),
              
              blurRadius: 10,
              offset: Offset(0, 5)
            )
          ]
        ),
        child: Text(
          '$numerus'.replaceAll('.0', ''),
          style: TextStyle(
            color: numerus == CalceusState.mensura ? Colors.white : Color.fromARGB(255, 241, 162, 58)
          ),
        ),
      ),
    );
  }
}