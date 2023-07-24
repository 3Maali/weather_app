import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/info_card.dart';
import 'package:glass/glass.dart';
import '../models/city_model.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.info});

  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 14, 71),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white)),
                ],
              ),
              Image.network(
                "${info.current?.condition?.icon}",
                scale: 0.5,
              ),
              Text(
                '${info.current?.tempC}°',
                style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '${info.current?.condition?.text}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                '${info.location?.name}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 90,
                        width: 290,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(60, 116, 174, 235),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${info.location?.country} | ${info.location?.localtime}  ",
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                '${info.location?.tzId}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ).asGlass(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCards(
                        info: info,
                        text: info.current?.tempC,
                        name: "tempC",
                      ),
                      InfoCards(
                        info: info,
                        text: info.current?.tempF,
                        name: "tempF",
                      ),
                      InfoCards(
                        info: info,
                        text: info.current?.isDay,
                        name: "is DAY",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoCards(
                        info: info,
                        text: info.current?.feelslikeC,
                        name: "feelslikeC",
                      ),
                      InfoCards(
                        info: info,
                        text: info.current?.feelslikeF,
                        name: "feelslikeF",
                      ),
                      InfoCards(
                        info: info,
                        text: info.current?.cloud,
                        name: "Cloud",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    //  Color.fromARGB(255, 21, 0, 99),
                    height: 200,
                    width: 290,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(60, 116, 174, 235),
                      borderRadius: BorderRadius.circular(20),
                      //   borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "humidity",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SleekCircularSlider(
                          min: 0,
                          max: 100,
                          initialValue: info.current!.humidity!.toDouble(),
                          appearance: CircularSliderAppearance(
                            animationEnabled: true,
                            size: 140,
                            customColors: CustomSliderColors(
                              hideShadow: true,
                              trackColor: const Color.fromARGB(43, 11, 14, 71),
                              progressBarColors: [
                                const Color.fromARGB(190, 11, 14, 71),
                                const Color.fromARGB(255, 63, 70, 206),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).asGlass(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
