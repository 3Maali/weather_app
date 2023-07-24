import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/w_city_info_card.dart';
import 'package:flutter_weather_app/data.dart';

import '../screens/home_screen.dart';
import '../services/api.dart';

class SelectingSheet extends StatelessWidget {
  const SelectingSheet({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(190, 11, 14, 71),
        body: FutureBuilder(
            future: ApiService().getCityInfo(keyword),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Column(
                  children: [
                    WCityInfoCard(
                      info: snapshot.data!,
                    ),
                 
                    const SizedBox(
                      height: 64,
                    ),

                    FloatingActionButton(
                        backgroundColor: Colors.white30,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        focusColor: Colors.white,
                        onPressed: () {
                          Data.favoriteCities.add(snapshot.data!);
                          Navigator.pop(context);
                          context
                              .findRootAncestorStateOfType<HomeScreenState>()
                              ?.setState(() {});
                        },
                        child: const Icon(Icons.add)),
                 
                  ],
                );
              }
              return const Center(child: Text('Not Found'));
            }),
      ),
    );
  }
}
