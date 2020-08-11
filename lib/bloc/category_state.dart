part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoad extends CategoryState {
  // const 
  List<CategoryModel> categories;
  CategoryLoad(this.categories);
}