class HomeEvent {}

class ShowHome extends HomeEvent {}

class BannerHome extends HomeEvent {}

class CategoriesHome extends HomeEvent {}

class ProductEvaluationHome extends HomeEvent {}

class CategoriesFruitsHome extends HomeEvent {}

class CategoriesVegetablesHome extends HomeEvent {}

class CategoriesMealsHome extends HomeEvent {}

class CategoriesDrinksHome extends HomeEvent {}

class AddToFavorite extends HomeEvent {
  final int id;
  AddToFavorite({required this.id});
}
