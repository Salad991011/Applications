import 'package:flutter/material.dart';
import '../../models/models_exports.dart';
import '../screens/exports/screens.dart';

class SearchBox extends StatefulWidget {
  final List<Restaurant> restaurants;

  const SearchBox({Key? key, required this.restaurants}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  List<Restaurant> filteredRestaurants = [];

  void updateList(String value) {
    setState(() {
      if (value.isEmpty) {
        filteredRestaurants = [];
      } else {
        filteredRestaurants = widget.restaurants.where((restaurant) {
          final name = restaurant.name.toLowerCase();
          final searchValue = value.toLowerCase();
          return name.contains(searchValue);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What are you looking for? ',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Choose your truck",
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                prefixIconColor: Colors.white,
              ),
              onChanged: updateList,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResturantDetails(
                            resturnat: filteredRestaurants[index],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        filteredRestaurants[index].name,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
