import 'package:food_app/models/models_exports.dart';

abstract class BaseRestaurantRepository {
  Stream<List<Restaurant>> getRestaurants();
  // Stream<Restaurant> getRestaurant();
}
