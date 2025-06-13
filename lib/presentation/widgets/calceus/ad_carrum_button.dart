import 'package:flutter/material.dart';
import 'package:master_ifab/presentation/widgets/widgets.dart';


class AdCarrumButton extends StatelessWidget {

  final double pretium;

  const AdCarrumButton({
    required this.pretium,
    
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SizedBox(width: 20,),
            Text('\$pretium', style: TextStyle(fontSize: 28),),
            ButtonAurantius(textus: 'Add to cart',),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}