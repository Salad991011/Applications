import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/screens/exports/screens.dart';
import '../../bloc/bloc_export.dart';
import '../../models/models_exports.dart';
import '../../models/promo_model.dart';
import '../../widgets/promobox.dart';
import '../../widgets/resturantcards.dart';
import '../../widgets/searchbox.dart';
import '../../widgets/settings_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CollectionReference resturantref =
      FirebaseFirestore.instance.collection('restaurant_data');

  get i => null;
  // CardVarModel cardData = CardVarModel();

  void _navigateToSettings() {
    // Navigate to settings screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SettingScreen()),
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _openDrawer,
        ),
        title: Text(
          'Truck Village',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Center(
                    child: Text(
                      'Truck Village',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                  onTap: _navigateToSettings,
                ),
                const SizedBox(
                  height: 450,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 20),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, '/logIn');
                        });
                      },
                      child: Text(
                        'logout',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.black,
                            ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchBox(
                  restaurants: [],
                ),
                //+++++++++++++++++++++++++++++++++
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: PromoModel.promos.length,
                    itemBuilder: (context, index) {
                      return PromoBox(
                        promo: PromoModel.promos[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              left: 16,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'For you',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<RestaurantsBloc, RestaurantsState>(
            builder: (context, state) {
              if (state is RestaurantsLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
              if (state is RestaurantsLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.restaurants.length,
                    itemBuilder: (context, index) {
                      return ResturantCards(
                        resturnat: state.restaurants[index],
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Top Picks',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: StaticResturant.staticResturants.length,
            itemBuilder: (context, index) {
              return StaticResturantCard(
                staticResturnat: StaticResturant.staticResturants[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
