import 'package:flutter/material.dart';
import 'package:master_ifab/presentation/widgets/widgets.dart';

class CalceusScreen extends StatelessWidget {
  const CalceusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PropriumAppbar(textus: 'For you',),
          SizedBox(height: 20, ),

          Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

                const Hero(
                  tag: 'zapato-1',
                  child: CalceusPraevidere()
                  ),
                  
                CalceusDescriptio(
                  titulus: 'Nike Air Max 720', 
                  descriptio:  """The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit 
                    yet. offering more air underfoot for unimaginable, all-day comfort. Has Air Max
                    gone too far? We hope so."""
                  ),
          
                  
          
            ],
          ),
        ),
      ),
      
    AdCarrumButton(pretium: 180.0)
          
   ],
   ),
            
    );
  }
}


