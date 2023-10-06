// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_settings_screen_ex/flutter_settings_screen_ex.dart';

class BuilderWidgets extends StatefulWidget {
  String title;
  IconData icons;
  Color iconscolor;
  String subtitle;
  String reRoute;
  Container containerNeeded = Container();
  BuilderWidgets({
    Key? key,
    required this.title,
    required this.icons,
    required this.subtitle,
    required this.reRoute,
    required this.iconscolor,
    required this.containerNeeded,
  }) : super(key: key);

  @override
  State<BuilderWidgets> createState() => _BuilderWidgetsState();
}

class _BuilderWidgetsState extends State<BuilderWidgets> {
  void onChanegsRoute(String routeName) {
    setState(() {
      widget.reRoute = Navigator.pushNamed(context, routeName) as String;
    });
  }

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        titleTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.black,
            ),
        title: widget.title,
        subtitle: widget.subtitle,
        leading: buildicon(context),
        child: widget.containerNeeded,
        onTap: () {
          widget.reRoute;
        },
      );

  Widget buildicon(BuildContext context) => Container(
        padding: const EdgeInsets.all(6),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: widget.iconscolor),
        child: Icon(
          widget.icons,
          color: Colors.white,
        ),
      );
}
