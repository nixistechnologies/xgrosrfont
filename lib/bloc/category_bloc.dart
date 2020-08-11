import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xgrosr/bloc/category_repository.dart';
import 'package:xgrosr/models/categoryModel.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  // CategoryRepository repository;
  // CategoryBloc() : super(repository);

  CategoryBloc({@required CategoryRepository repository})
      : assert(repository != null),
        _repository = repository,
        super(CategoryInitial());
  final CategoryRepository _repository;

  // @override
  // CategoryState get initialState => CategoryInitial();
  // CategoryBloc() : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is CategoryOpened){
      // print("opend");
      yield CategoryLoading();
      final data = await _repository.fetchCategory();
      yield CategoryLoad(data); 
    }
  }
}
