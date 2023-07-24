import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import '../models/city_model.dart';

class WCityInfoCard extends StatelessWidget {
  const WCityInfoCard({super.key, required this.info});

  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(60, 116, 174, 235),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${info.location?.name}',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '${info.current?.condition?.text}',
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                width: 140,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${info.current?.tempC}°',
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  Text(
                    'Feels like: ${info.current?.feelslikeC}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ).asGlass(),
        //.asGlass(),
      ),
    );
  }
}
