
import 'package:intl/intl.dart';

class IntelligibilisForma {
static String novaFormaNumeri(double numerus){
    return NumberFormat.compactCurrency(
decimalDigits: 0,
symbol: '',
    ).format(numerus);
  }

}

