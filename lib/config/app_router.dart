import 'package:flutter/material.dart';
import 'package:food_app/models/models_exports.dart';
import '../screens/exports/screens.dart';
import '../screens/resturant_details/static_resturant_details.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    print('the route name${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case BasketDetails.routeName:
        return BasketDetails.route();
      case StaticResturantDetails.routeName:
        return StaticResturantDetails.route(
            resturant: settings.arguments as StaticResturant);
      case CheckOut.routeName:
        return CheckOut.route();

      case LogIn.routeName:
        return LogIn.route();
      case SignUp.routeName:
        return SignUp.route();
      case ResturantDetails.routeName:
        return ResturantDetails.route(
            resturant: settings.arguments as Restaurant);
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
