import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/selecting_sheet.dart';

class WTextField extends StatefulWidget {
  const WTextField({
    super.key,
  });

  @override
  State<WTextField> createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: textEditingController,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Search",
          prefixIconColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          // hoverColor: const Color.fromARGB(255, 180, 196, 255),

          // fillColor: const Color.fromARGB(107, 88, 88, 88),
          //fillColor: const Color.fromARGB(190, 116, 174, 235),
          fillColor: const Color.fromARGB(60, 116, 174, 235),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          filled: true,
        ),
        //--------
        onSubmitted: (text) {
          showBottomSheet(
            context: context,
            builder: (context) {
              return SelectingSheet(keyword: text);
            },
          );
        },
      ),
    );
  }
}
