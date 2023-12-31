class UserLocation{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimezoneCoordinate timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.street,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json){

    final street=LocationStreet.fromMap(json["street"]);
    final coordinates=LocationCoordinate.fromMap(json["coordinates"]);
    final timezone=LocationTimezoneCoordinate.fromMap(json["timezone"]);
    return UserLocation(
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"].toString(),
        coordinates: coordinates,
        street: street,
        timezone: timezone);
  }
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.name, required this.number});
  factory LocationStreet.fromMap(Map<String, dynamic> json){
    return LocationStreet(name: json["name"], number: json["number"]);
  }
}

class LocationCoordinate{
 final String latitude;
 final String longitude;
 LocationCoordinate({required this.latitude, required this.longitude});
 factory LocationCoordinate.fromMap(Map<String, dynamic> json){
   return LocationCoordinate(latitude: json["latitude"], longitude: json["longitude"]);
 }
}

class LocationTimezoneCoordinate{
  final String offset;
  final String description;

  LocationTimezoneCoordinate({required this.offset, required this.description});
  factory LocationTimezoneCoordinate.fromMap(Map<String, dynamic> json){
    return LocationTimezoneCoordinate(offset: json["offset"], description: json["description"]);
  }

}
