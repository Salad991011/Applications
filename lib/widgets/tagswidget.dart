import 'package:flutter/material.dart';

import '../models/restaurants_model.dart';

class TageWidget extends StatelessWidget {
  const TageWidget({
    super.key,
    required this.resturnat,
  });

  final Restaurant resturnat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: resturnat.tags
            .map(
              (tag) => resturnat.tags.indexOf(tag) == resturnat.tags.length - 1
                  ? Text(
                      tag,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black),
                    )
                  : Text(
                      '$tag,',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black),
                    ),
            )
            .toList(),
      ),
    );
  }
}
