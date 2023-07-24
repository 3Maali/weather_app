import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import '../models/city_model.dart';

class InfoCards extends StatelessWidget {
  const InfoCards({
    super.key,
    required this.info,
    required this.text,
    required this.name,
  });
  final String name;
  final dynamic text;
  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(60, 116, 174, 235),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$text',
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    ).asGlass();
  }
}
