// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(
      {super.key,
      required this.name,
      required this.icon,
      required this.children});

  final String name;
  final Widget icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            alignment: Alignment.centerLeft,
            // color: Colors.black12,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                  ),
                  child: icon,
                ),
              ),
              Text(name),
            ]),
          ),
          ...children,
        ]),
      ),
    );
  }
}
