import 'package:geolocator/geolocator.dart';

class Location{
  late  double latitude;
  late double longitude;
  Future<void> getcurrentLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print('permission not given');
      LocationPermission asked = await Geolocator.requestPermission();
    }
    try{
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
      print('latitude: $latitude');
      print('longitude: $longitude');
    }
    catch(e){
      print(e);
    }
  }
}