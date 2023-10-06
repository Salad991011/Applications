import 'package:equatable/equatable.dart';
import 'models_exports.dart';

class StaticResturant extends Equatable {
  final int staticId;
  final String staticImageUrl;
  final String staticName;
  final List<String> staticTages;
  final List<MenuItem> staticMenuItems;
  final int staticDelivTime;
  final double staticDelivFee;

  const StaticResturant({
    required this.staticId,
    required this.staticImageUrl,
    required this.staticName,
    required this.staticTages,
    required this.staticMenuItems,
    required this.staticDelivTime,
    required this.staticDelivFee,
  });

  @override
  List<Object?> get props => [
        staticId,
        staticImageUrl,
        staticName,
        staticTages,
        staticMenuItems,
        staticDelivTime,
        staticDelivFee,
      ];
  static List<StaticResturant> staticResturants = [
    StaticResturant(
      staticId: 3,
      staticImageUrl:
          'https://images.unsplash.com/photo-1668583029711-cccc9d1f109c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
      staticName: 'Truck Way',
      staticTages:
          MenuItem.MenuItems.where((menuItems) => menuItems.restaurantId == 3)
              .map((menuItem) => menuItem.category)
              .toSet()
              .toList()
              .toList(),
      staticDelivTime: 30,
      staticDelivFee: 2.0,
      staticMenuItems:
          MenuItem.MenuItems.where((menuItems) => menuItems.restaurantId == 3)
              .toList(),
    ),
    StaticResturant(
      staticId: 1,
      staticImageUrl:
          'https://images.unsplash.com/photo-1616420812082-1ff2334daf57?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      staticName: 'Burger Truck',
      staticTages:
          MenuItem.MenuItems.where((menuItems) => menuItems.restaurantId == 1)
              .map((menuItem) => menuItem.category)
              .toSet()
              .toList()
              .toList(),
      staticDelivTime: 50,
      staticDelivFee: 2.0,
      staticMenuItems:
          MenuItem.MenuItems.where((menuItems) => menuItems.restaurantId == 1)
              .toList(),
    ),
    StaticResturant(
      staticId: 2,
      staticImageUrl:
          'https://images.unsplash.com/photo-1536622308015-0740925b8221?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      staticName: 'pizza ',
      staticTages:
          MenuItem.MenuItems.where((menuItems) => menuItems.restaurantId == 2)
              .map((menuItem) => menuItem.category)
              .toSet()
              .toList()
              .toList(),
      staticDelivTime: 20,
      staticDelivFee: 2.0,
      staticMenuItems:
          MenuItem.MenuItems.where((menuItems) => menuItems.restaurantId == 2)
              .toList(),
    ),
  ];
}
