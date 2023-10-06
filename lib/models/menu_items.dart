import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  const MenuItem(
      {required this.id,
      required this.restaurantId,
      required this.name,
      required this.category,
      required this.description,
      required this.price});

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
      ];

  static List<MenuItem> MenuItems = const [
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Honey Masturd Burger',
        category: 'Burger',
        description: 'Beef Burger With Honey Mastured Sauce and Pickles',
        price: 4.99),
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'BBQ Sauce Crispy Burger',
        category: 'Burger',
        description: 'Crispy Checken Burger with BBQ Sauce and Latuce',
        price: 4.50),
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Angus Beef Burger',
        category: 'Burger',
        description: 'Angus Beef Burger with Pickles, Latuce and Fries',
        price: 6.99),
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Mashroom Beef Burger',
        category: 'Burger',
        description:
            'Beef Burger With Honey Mastured Sauce and mashrooms and Pickles',
        price: 3.99),
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Chicken Mashroom Burger',
        category: 'Burger',
        description:
            'Chicken Burger With Honey Mastured Sauce and Mashroom and Pickles',
        price: 5.50),
    MenuItem(
        id: 1,
        restaurantId: 2,
        name: 'Pepperoni Pizza',
        category: 'Pizza',
        description: 'Features Tomato sauce, Mozzarella, Chili peppers',
        price: 5.99),
    MenuItem(
        id: 1,
        restaurantId: 2,
        name: 'Neapolitan Pizza',
        category: 'Pizza',
        description:
            'Features tomatoes, garlic, oregano, and extra virgin olive oil.',
        price: 2.50),
    MenuItem(
        id: 1,
        restaurantId: 2,
        name: 'Chicago Pizza',
        category: 'Pizza',
        description:
            'Features onions, olives, and mushrooms, plus bacon and pepperoni.',
        price: 5.99),
    MenuItem(
        id: 1,
        restaurantId: 2,
        name: 'Mozzarella',
        category: 'Pizza',
        description: 'Tomato Sauce, Buffalo mozzarella ',
        price: 2.99),
    MenuItem(
        id: 1,
        restaurantId: 2,
        name: 'Al Salmone',
        category: 'Pizza',
        description: 'Tomato sauce, Mozzarella, Salmon, Garlic',
        price: 5.99),
    MenuItem(
        id: 1,
        restaurantId: 3,
        name: 'Chicken Shawarma',
        category: 'Shawarma',
        description:
            'Marinated grilled chickenGarlic sauce, Tahini sauce ,Pickles, Tomatoes ,Lettuce, Onions',
        price: 4.99),
    MenuItem(
        id: 1,
        restaurantId: 3,
        name: 'Beef Shawarma',
        category: 'Shawarma',
        description: 'Crispy Checken Burger with BBQ Sauce and Latuce',
        price: 4.50),
    MenuItem(
        id: 1,
        restaurantId: 3,
        name: 'Lamb Shawarma',
        category: 'Shawarma',
        description:
            'Marinated and slow-roasted lamb, Garlic sauce, Tahini sauce, Pickles',
        price: 2.99),
    MenuItem(
        id: 1,
        restaurantId: 3,
        name: 'Mixed Shawarma',
        category: 'Shawarma',
        description:
            'Combination of grilled chicken, beef, and/or lamb, Garlic sauce, Tahini sauce, Pickles',
        price: 1.99),
  ];
}
