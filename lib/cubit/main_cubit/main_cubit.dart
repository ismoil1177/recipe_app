import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app1/model/recipe_model.dart';
import 'package:recipe_app1/services/core/service_locator.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainInitial());

  void fetchRecipes() async {
    emit(MainLoading(recipe: state.recipe));
    try {
      final recipes = await repository.readRecipe();
      emit(MainFetchSuccess(recipe: recipes));
    } catch (e) {
      emit(MainFailure(recipe: state.recipe, message: "HOME ERROR: $e"));
    }
  }
}
