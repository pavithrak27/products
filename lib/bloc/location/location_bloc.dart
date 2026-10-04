import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/bloc/location/location_Repository.dart';
import 'package:products/bloc/location/location_event.dart';
import 'package:products/bloc/location/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository repository;

  LocationBloc({required this.repository}) : super(LocationInitial()) {
    on<LoadLocations>(_loadLocations);
    on<LoadAreas>(_loadareas);
  }
  Future<void> _loadLocations(
    LocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());

    try {
      final locations = await repository.prefferedLocations();
      emit(LocationLoaded(locations: locations));
    } catch (e) {
      emit(LocationError(message: e.toString()));
    }
  }

  Future<void> _loadareas(LoadAreas event, Emitter<LocationState> emit) async {
    List locations = [];
    emit(LocationLoading());
    if (state is LocationLoaded) {
      locations = (state as LocationLoaded).locations;
    }
    if (state is AreaLoaded) {
      locations = (state as AreaLoaded).locations;
    }
    emit(AreaLoading(areas: locations.cast()));
    try {
      final areas = await repository.getAreas(event.locationCode);

      emit(AreaLoaded(areas: areas, locations: locations.cast()));
    } catch (e) {
      emit(LocationError(message: e.toString()));
    }
  }
}
