import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/models/category_model.dart';
import 'package:http/http.dart';

class CategoryLoader with ChangeNotifier {
  Category? category;

  bool _isError = false;

  //Getters
  bool get isError => _isError;

  Future<void> getCategoryData(String categoryName) async {
    print("Method Running: getCategoryData");
    await get(
      Uri.parse(
        "https://palota-jobs-africa-spotify-fa.azurewebsites.net/api/browse/categories/$categoryName",
      ),
      headers: {
        "x-functions-key":
            "_q6Qaip9V-PShHzF8q9l5yexp-z9IqwZB_o_6x882ts3AzFuo0DxuQ=="
      },
    ).timeout(const Duration(seconds: 5)).then(
      (response) {
        print("then: getCategoryData");
        if (response.statusCode == 200) {
          //Parse JSON Data
          final mapCategoryData = jsonDecode(response.body);
          print(mapCategoryData);
          //Instantiate Category Object
          category = Category.fromJson(mapCategoryData);
        }
        _isError = false;
      },
    ).onError(
      (error, stackTrace) {
        //TODO: Present Errors to user
        _isError = true;
        print("error: getCategoryData");
        print(error.toString());
      },
    );
  }
}
