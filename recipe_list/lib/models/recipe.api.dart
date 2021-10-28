import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_list/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list",
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "f1f0fbb77dmshf386fcf3830a957p140682jsn3470a8673c67"
    });

    Map data = json.decode(response.body);
    List _temp = [];

    for (var i in data["feed"]) {
      _temp.add(i["content"]["details"]);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
