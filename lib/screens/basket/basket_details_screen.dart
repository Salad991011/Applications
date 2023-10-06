import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/bloc/static_bloc/bloc/static_basket_bloc.dart';
import 'package:food_app/models/models_exports.dart';

import '../../bloc/basket_bloc/basket_bloc.dart';

class BasketDetails extends StatefulWidget {
  static const String routeName = '/basketDetails';

  const BasketDetails({super.key});
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BasketDetails(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<BasketDetails> createState() => _BasketDetailsState();
}

class _BasketDetailsState extends State<BasketDetails> {
  final _locationController = TextEditingController();
  // ignore: unused_field
  String _enteredLocation = '';

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'basket',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ],
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
                    Navigator.pushNamed(context, '/checkOut');
                  },
                  child: const Text("Go to Checkout"),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cutelry',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Do you want Cutelry Included?",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ),
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoading) {
                            return const CircularProgressIndicator();
                          } else if (state is BasketLoaded) {
                            return SizedBox(
                              width: 100,
                              child: SwitchListTile(
                                dense: false,
                                value: state.basket.cutlery,
                                onChanged: (bool? newValue) {
                                  context
                                      .read<BasketBloc>()
                                      .add(const ToggleSwitch());
                                },
                              ),
                            );
                          } else {
                            return const Text('Something Went wrong');
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Items',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is BasketLoaded) {
                      final itemQuantity =
                          state.basket.itemQuantity(state.basket.product);
                      return state.basket.product.isEmpty
                          ? Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No Items Selected',
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.basket
                                  .itemQuantity(state.basket.product)
                                  .length,
                              itemBuilder: (context, index) {
                                final itemQuantity = state.basket
                                    .itemQuantity(state.basket.product);
                                final itemEntry =
                                    itemQuantity.entries.elementAt(index);
                                final item = itemEntry.key as Product;
                                final quantity = itemEntry.value as int;
                                final price = item.price;

                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "$quantity x",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background
                                                    .withBlue(100)
                                                    .withRed(255),
                                              ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${price}JD",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                    } else {
                      return const Text('Something went Wrong');
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<StaticBasketBloc, StaticBasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is StaticBasketLoaded) {
                      final itemQuantity = state.basketItems
                          .staticitemQuantity(state.basketItems.items);
                      return state.basketItems.items.isEmpty
                          ? Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No Items Selected',
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.basketItems
                                  .staticitemQuantity(state.basketItems.items)
                                  .length,
                              itemBuilder: (context, index) {
                                final itemQuantity = state.basketItems
                                    .staticitemQuantity(
                                        state.basketItems.items);
                                final itemEntry =
                                    itemQuantity.entries.elementAt(index);
                                final item = itemEntry.key as MenuItem;
                                final quantity = itemEntry.value as int;
                                final price = item.price;

                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "$quantity x",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background
                                                    .withBlue(100)
                                                    .withRed(255),
                                              ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${price}JD",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                    } else {
                      return const Text('Something went Wrong');
                    }
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Delivery Location',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _locationController,
                  onChanged: (value) {
                    setState(() {
                      _enteredLocation = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hintText: 'Enter your location',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _enteredLocation = _locationController.text;
                  },
                  child: const Text('Save Location'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 20),
                        height: 150,
                        width: 150,
                        child: SvgPicture.asset('assets/logos/Air-Drop.svg'),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Delivery in 30 Min',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoaded) {
                            return state.basket.voucher == null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Do you Have a Voucher?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/voucherScreen');
                                        },
                                        child: Text(
                                          'Apply',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background
                                                    .withBlue(100)
                                                    .withRed(255),
                                              ),
                                        ),
                                      )
                                    ],
                                  )
                                : Text(
                                    'Your voucher is added!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  );
                          } else {
                            return const Text('Something went wrong');
                          }
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        height: 150,
                        width: 110,
                        child: SvgPicture.asset('assets/logos/Voucher.svg'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: BlocBuilder<BasketBloc, BasketState>(
                    builder: (context, state) {
                      if (state is BasketLoading) {
                        return const CircularProgressIndicator();
                      }
                      if (state is BasketLoaded) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                Text(
                                  '${state.basket.subtotalString} JDs',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery fee',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  state.basket.product.isEmpty
                                      ? '${0}'
                                      : '\$2.0 JDs',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  state.basket.product.isEmpty
                                      ? '${0}'
                                      : '${state.basket.totalString} JDs',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const Text("someting went wrong");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
