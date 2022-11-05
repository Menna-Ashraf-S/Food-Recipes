import 'package:flutter_pro/model.recipes/allData.dart';
import 'package:http/http.dart';
import 'dart:convert';

class API{  
   static Future<AllData> getRecipes() async {
    Response recipes = await get(Uri.parse('https://api.spoonacular.com/recipes/complexSearch?apiKey=2c9a850ebcfe42adaaf88f097376ccec'));
    if (recipes.statusCode <= 299 && recipes.statusCode >= 200 ){
      final Map<String , dynamic> jsonBody = jsonDecode(recipes.body);
      AllData alldata =AllData.fromJson(jsonBody);
      return alldata ;
    }
    else {
      throw Exception('can not get Recipes ${recipes.body}');
    }
  }
}