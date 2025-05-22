import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final estTenebrisModusProvider = StateProvider<bool>((ref) => false);


final colorumIndexProvider = Provider((ref)=>colorum);

final electusColorProvider = StateProvider<int>((ref) => 0);