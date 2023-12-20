import 'dart:convert';

import 'package:recipe_app1/model/recipe_model.dart';

import 'package:recipe_app1/services/data/local_data_source.dart';

abstract class RecipeRepository {
  Future<bool> storeRecipe(Recipe recipe);
  List<Recipe> readRecipe();
  Future<bool> clearCache();
}

class RecipeRepositoryImpl implements RecipeRepository {
  final LocalDataSource dataSource;
  const RecipeRepositoryImpl({required this.dataSource});

  @override
  Future<bool> clearCache() {
    return dataSource.remove(StorageKey.recipes);
  }

  @override
  List<Recipe> readRecipe() {
    ///String data => json => Object

    String data = dataSource.read(StorageKey.recipes) ?? "[]";
    final json = jsonDecode(data) as List;
    return json
        .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> storeRecipe(Recipe recipe) {
    ///Object => json => String
    final list = readRecipe();
    list.add(recipe);
    final json = list.map((recipe) => recipe.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageKey.recipes, data);
  }
}
