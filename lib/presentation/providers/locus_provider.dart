import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';


final userLocureProvider = FutureProvider.autoDispose<(double, double)>((ref)async {


  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    
    throw'Location services are disabled.';
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
     
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    
     throw 'Location permissions are permanently denied, we cannot request permissions.';
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
final locus = await Geolocator.getCurrentPosition();

  return (locus.latitude, locus.longitude);


});

