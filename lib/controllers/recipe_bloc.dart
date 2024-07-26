import 'package:bloc/bloc.dart';
import 'recipe_event.dart';
import 'recipe_state.dart';
import '../services/recipe_service.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<FetchRecipes>((event, emit) async {
      emit(RecipeLoading());
      try {
        final recipes = await RecipeService.fetchRecipes();
        emit(RecipeLoaded(recipes));
      } catch (e) {
        emit(RecipeError(e.toString()));
      }
    });
  }
}