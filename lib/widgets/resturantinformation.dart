import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/bloc_export.dart';
import 'package:food_app/models/models_exports.dart';
import 'package:food_app/widgets/tagswidget.dart';

class ResturantInfo extends StatelessWidget {
  final Restaurant resturant;
  const ResturantInfo({super.key, required this.resturant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              resturant.name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Serving:',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
                TageWidget(resturnat: resturant),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Dilevery Time: ${resturant.deliveryTime} Min  - Delivery fee: ${resturant.deliveryFee}JD',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<RestaurantsBloc, RestaurantsState>(
            builder: (context, state) {
              if (state is RestaurantsLoaded) {
                final restaurant = state.restaurants;
                final openingHours = OpeningHours.openingHoursList;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Opening days:',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.only(bottom: 10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: openingHours.length,
                        itemBuilder: (context, index) {
                          final hours = openingHours[index];
                          final isOpen = hours.isOpen ? 'Open' : 'Closed';

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Text(
                                  '${hours.day}:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                const SizedBox(width: 8.0),
                                const SizedBox(width: 8.0),
                                Text(
                                  isOpen,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Divider(color: Colors.black.withOpacity(0.5), thickness: 1),
          Text(
            'Restaurnat Information',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<RestaurantsBloc, RestaurantsState>(
            builder: (context, state) {
              return Text(
                resturant.description,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
