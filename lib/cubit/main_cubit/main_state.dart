part of 'main_cubit.dart';

@immutable
abstract class MainState {
  final List<Recipe> recipe;
  const MainState({required this.recipe});
}

class MainInitial extends MainState {
  const MainInitial() : super(recipe: const []);
}

class MainLoading extends MainState {
  const MainLoading({required super.recipe});
}

class MainFailure extends MainState {
  final String message;
  const MainFailure({required super.recipe, required this.message});
}

class MainFetchSuccess extends MainState {
  const MainFetchSuccess({required super.recipe});
}
