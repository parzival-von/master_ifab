import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:master_ifab/presentation/providers/calceus_provider.dart';
import 'package:master_ifab/presentation/widgets/calceus/button_aurantius.dart';
import 'package:master_ifab/presentation/widgets/calceus/calceus_preavidere.dart';

class CalceusDescScreen extends StatelessWidget{
  const CalceusDescScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'zapato-1',
                child: CalceusPraevidere(screenCompletaEst: true,)
              ),
              Positioned(
                top: 60,
                child: FloatingActionButton(
                  onPressed: () {
                      context.pop();
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  child: const Icon(Icons.chevron_left, color: Colors.white, size:60,),
                )
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Aquí puedes agregar un widget de descripción si lo tienes
                  _PretiumEtBuyNow(),
                  _ColoresEtAlterButton(),
                  _ButtonsLikeCartSettings()
                ],
              ),
            )
          )
        ],
      )
    );
  }
}

class _PretiumEtBuyNow extends StatelessWidget {
  const _PretiumEtBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom:20),
        child: Row(
          children: [
            const Text('180.0', style: TextStyle(fontSize: 28),),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const ButtonAurantius(textus: 'Buy now', latitus: 120, altus:40),
            ),
            const ButtonAurantius(textus: 'Buy now', latitus: 120, altus:40)
          ],
        ),
      ),
    );
  }
}

class _ColoresEtAlterButton extends StatelessWidget {
  const _ColoresEtAlterButton();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _ActionButtonColor(
                    color: Color.fromARGB(255, 198, 214, 66), 
                    index: 4,
                    urlImago: 'assets/img/verde.png',),
                ),
                Positioned(
                  left: 60,
                  child: _ActionButtonColor(
                    color: Color.fromARGB(255, 255, 173, 41),
                    index: 3,
                    urlImago: 'assets/img/amarillo.png',
                  ),
                ),
                Positioned(
                  left: 30,
                  child: _ActionButtonColor(
                    color: Color.fromARGB(255, 32, 153, 241),
                    index: 2,
                    urlImago: 'assets/img/azul.png',
                  ),
                ),
                _ActionButtonColor(
                  color: Color.fromARGB(255, 54, 77, 86),
                  index: 1,
                  urlImago: 'assets/img/negro.png',
                ),
              ],
            )
          ),
          const ButtonAurantius(
            textus: 'More related items',
            altus: 30,
            latitus: 170,
            color: Color.fromARGB(255, 255, 198, 17),
          )
        ],
      ),
    );
  }
}

class _ActionButtonColor extends ConsumerWidget {
  final Color color;
  final int index;
  final String urlImago;
  const _ActionButtonColor({
    required this.color,
    required this.index,
    required this.urlImago,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: (){
          ref.read(calceusProvider.notifier).ponereAssetImago(urlImago);
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}


class _ButtonsLikeCartSettings extends StatelessWidget {

  
  //final int index;
  const _ButtonsLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            _ButtonCumUmbra(icon: Icon(Icons.star, color: Colors.red, size: 25,)),
            _ButtonCumUmbra(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withValues(alpha:0.4), size: 25,)),
             _ButtonCumUmbra(icon: Icon(Icons.settings, color: Colors.grey.withValues(alpha:0.4), size: 25,)),

        ],
        )
    );

  }
}

class _ButtonCumUmbra extends StatelessWidget {

  final Icon icon;
  
  //final int index;
  const _ButtonCumUmbra({
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ]
      ),
      child: icon,
    );

  }
}

