
import 'package:intl/intl.dart';

class IntelligibilisForma {
  //Cambiar formato
  static String novaFormaNumeri(double numerus){
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(numerus);
  }
}