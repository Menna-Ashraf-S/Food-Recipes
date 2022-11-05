import 'package:flutter_pro/model.details/details_recipe.dart';
import 'package:http/http.dart';
import 'dart:convert';

class API_Details {
static Future<Details_Recipe> getRecipesDetails(int id) async {
    Response recipes = await get(Uri.parse('https://api.spoonacular.com/recipes/${id}/information?apiKey=2c9a850ebcfe42adaaf88f097376ccec'));
    if (recipes.statusCode <= 299 && recipes.statusCode >= 200 ){
      final Map<String , dynamic> jsonBody = jsonDecode(recipes.body);
      Details_Recipe details_recipe =Details_Recipe.fromJson(jsonBody);
      return details_recipe ;
    }
    else {
      throw Exception('can not get Recipes Details ${recipes.body}');
    }
  }

}