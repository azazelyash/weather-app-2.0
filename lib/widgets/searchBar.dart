import 'package:flutter/material.dart';
import 'package:weather_app_2/constants/constants.dart';

TextFormField searchBar(
  String searchBarText,
  Color buttonBgColor,
  Color iconColor,
  Color filledColor,
) {
  return TextFormField(
    onChanged: (value) {
      searchBarText = value;
    },
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      hintText: "Search",
      suffixIcon: FloatingActionButton(
        backgroundColor: buttonBgColor,
        onPressed: () {
          print(searchBarText);
        },
        child: Icon(
          Icons.search,
          color: iconColor,
        ),
      ),
      hintStyle: const TextStyle(fontWeight: FontWeight.w500),
      filled: true,
      fillColor: filledColor,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    ),
  );
}
