import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Position> getPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled';
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
      throw 'Location permission denied';
    }
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  Future<String> reverseGeocode(double lat, double lng) async {
    final placemarks = await placemarkFromCoordinates(lat, lng);
    final p = placemarks.first;
    return [
      p.name,
      p.street,
      p.locality,
      p.administrativeArea,
      p.postalCode,
      p.country
    ].where((e) => e != null && e!.isNotEmpty).map((e) => e!).join(', ');
  }
}
