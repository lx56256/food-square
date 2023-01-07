import 'package:food_square/core/model/meal_model.dart';
import 'package:food_square/core/view_model/base_view_model.dart';

class FavoriteViewModel extends BaseViewModel {
  void addMeal(MealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(MealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  bool isFavorite(MealModel meal) {
    return originMeals.contains(meal);
  }

  void handleMeal(MealModel meal) {
    if (isFavorite(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}
