import 'package:flutter/material.dart';
import 'package:food_app/widgets/tagswidget.dart';
import '../../models/models_exports.dart';

class ResturantCards extends StatelessWidget {
  final Restaurant resturnat;
  const ResturantCards({Key? key, required this.resturnat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // inkwell is like Gestordetector widget
      onTap: () {
        Navigator.pushNamed(context, '/resturantDetails', arguments: resturnat);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(resturnat.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 10.15,
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${resturnat.deliveryTime} min',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  resturnat.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TageWidget(resturnat: resturnat),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${resturnat.deliveryFee}JD dilvery fee',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
