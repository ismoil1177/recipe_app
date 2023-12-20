import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe_app1/model/recipe_model.dart';
import 'package:recipe_app1/services/core/service_locator.dart';
part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  void create(String name, String description, double duration, String imageUrl,
      String username, String userImageUrl) async {
    if (name.isEmpty ||
        description.isEmpty ||
        username.isEmpty ||
        userImageUrl.isEmpty ||
        duration.toString().isEmpty ||
        imageUrl.isEmpty) {
      emit(const UploadFailure(message: "Please fill in all the fields"));
      return;
    }
    emit(UploadLoading());
    try {
      final id = repository.readRecipe().length + 1;
      final recipe = Recipe(
          id: id,
          name: name,
          description: description,
          duration: duration,
          userImageUrl: userImageUrl,
          username: username,
          imageUrl: imageUrl);
      await repository.storeRecipe(recipe);
      emit(UploadCreateSuccess());
    } catch (e) {
      debugPrint("Error: $e");
      emit(UploadFailure(message: "DETAIL ERROR:$e"));
    }
  }

  void pickImage(File? file) {}
}
