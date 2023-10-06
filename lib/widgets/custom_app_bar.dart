import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.person,
      ),
    ),
    centerTitle: false,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Location',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Irbid, alworod',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    ),
  );
}
