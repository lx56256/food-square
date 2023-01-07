import 'package:food_square/core/service/json_parse.dart';
import 'package:food_square/core/view_model/base_view_model.dart';
import '../service/json_parse.dart';

class MealViewModel extends BaseViewModel {
  MealViewModel() {
    JsonParse.getMealData().then((value) {
      meals = value;
      notifyListeners();
    });
  }
}
