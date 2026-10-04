abstract class LocationEvent {}

class LoadLocations extends LocationEvent {}

class LoadAreas extends LocationEvent {
  final String locationCode;
  LoadAreas({required this.locationCode});
}
