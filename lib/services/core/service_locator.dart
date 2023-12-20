

import 'package:recipe_app1/repository/recipe_repository.dart';
import 'package:recipe_app1/services/data/local_data_source.dart';

late final RecipeRepository repository;

Future<void> serviceLocator() async {
  /// third party api => storage
  final db = await LocalDataSourceImpl.init;

  //data
  LocalDataSource dataSource = LocalDataSourceImpl(db: db);

  //repository
  repository = RecipeRepositoryImpl(dataSource: dataSource);
}
