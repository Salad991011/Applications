import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/static_bloc/bloc/static_basket_bloc.dart';
import 'bloc/bloc_export.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'repositories/restaurant/repo_export.dart';
import 'screens/exports/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RestaurantRepository>(
          create: (_) => RestaurantRepository(),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RestaurantsBloc(
                restaurantRepository: context.read<RestaurantRepository>(),
              ),
            ),
            BlocProvider<BasketBloc>(
              create: (context) => BasketBloc()
                ..add(
                  StartBasket(),
                ),
            ),
            BlocProvider<StaticBasketBloc>(
              create: (context) => StaticBasketBloc()
                ..add(
                  StartStaticBasket(),
                ),
            ),
          ],
          child: MaterialApp(
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGeneratedRoute,
            initialRoute: LogIn.routeName,
          )),
    );
  }
}
