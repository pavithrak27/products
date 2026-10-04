import 'package:products/model/location_model.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<LocationModel> locations;

  LocationLoaded({required this.locations});
}

class AreaLoading extends LocationState {
  final List<LocationModel> areas;
  AreaLoading({required this.areas});
}

class AreaLoaded extends LocationState {
  final List<LocationModel> locations;
  final List<LocationModel> areas;

  AreaLoaded({required this.locations, required this.areas});
}

class LocationError extends LocationState {
  final String message;

  LocationError({required this.message});
}
