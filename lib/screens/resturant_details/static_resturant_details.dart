import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/basket_bloc/basket_bloc.dart';
import 'package:food_app/bloc/static_bloc/bloc/static_basket_bloc.dart';
import 'package:food_app/models/models_exports.dart';
import 'package:food_app/widgets/static_restautant_info.dart';

class StaticResturantDetails extends StatelessWidget {
  static const String routeName = '/staticResturantDetails';

  const StaticResturantDetails({super.key, required this.resturnat});
  static Route route({required StaticResturant resturant}) {
    return MaterialPageRoute(
        builder: (_) => StaticResturantDetails(resturnat: resturant),
        settings: const RouteSettings(name: routeName));
  }

  final StaticResturant resturnat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: const RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/basketDetails');
                },
                child: const Text("Basket"),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    50,
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    resturnat.staticImageUrl,
                  ),
                ),
              ),
            ),
            StaticRestutantInfo(resturant: resturnat),
            Container(
              color: Colors.white,
              height: 200,
              width: double.infinity,
              child: BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10, top: 20),
                    shrinkWrap: true,
                    itemCount: resturnat.staticTages.length,
                    itemBuilder: (context, index) {
                      return _buildMenuItems(resturnat, context, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(
    StaticResturant restaurant,
    BuildContext context,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          child: Text(
            restaurant.staticTages[index],
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            if (state is BasketLoaded) {
              return Column(
                children: [
                  ...restaurant.staticMenuItems
                      .where((menuItem) =>
                          menuItem.category == restaurant.staticTages[index])
                      .map(
                        (menuItem) => Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                title: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        menuItem.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: Colors.black,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${menuItem.price} JD',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Colors.black,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 20),
                                          child: IconButton(
                                            onPressed: () {
                                              context
                                                  .read<StaticBasketBloc>()
                                                  .add(RemoveItem(menuItem));
                                            },
                                            icon: Icon(
                                              Icons.remove_circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: BlocBuilder<BasketBloc,
                                              BasketState>(
                                            builder: (context, state) {
                                              return IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<StaticBasketBloc>()
                                                      .add(AddItem(menuItem));
                                                },
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  menuItem.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 2,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ],
              );
            } else {
              return Center(
                child: Text(
                  'Something went wrong',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
