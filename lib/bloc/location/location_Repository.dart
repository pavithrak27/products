import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products/model/location_model.dart';

class LocationRepository {
  static String baseUrl = 'https://migrant.app.iproatdemo.com/api';

  Future<List<LocationModel>> prefferedLocations() async {
    final response = await http.get(
      Uri.parse('$baseUrl/preferred-locations?lang=en&page=1&per_page=15'),
    );
    if (response == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List locations = jsonData['Data']['preffered_locations'];
      return locations
          .map((location) => LocationModel.fromJson(location))
          .toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<LocationModel>> getAreas(String locationCode) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/preferred-locations/$locationCode/areas?lang=en&page=1&per_page=15',
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      final List areas = jsonData['Data']['area'];
      return areas.map((area) => LocationModel.fromJson(area)).toList();
    } else {
      throw Exception('failed to load');
    }
  }
}
