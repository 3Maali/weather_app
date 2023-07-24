import 'package:flutter/material.dart';
import 'package:flutter_weather_app/extinstions/context.dart';

import '../components/city_card.dart';
import '../components/w_city_info_card.dart';
import '../components/w_text_field.dart';
import '../data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     

      backgroundColor: const Color.fromARGB(255, 11, 14, 71),
      body: SingleChildScrollView(
      
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weather',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                  )
                ],
              ),
              const WTextField(),
              const SizedBox(
                height: 30,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    for (final city in Data.favoriteCities)
                      InkWell(
                        child: WCityInfoCard(info: city),
                        onTap: () {
                          context.pushPage(CityCard(info: city));
                        },
                      ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
