import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';
import '../../repository/fetch_api.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  FetchApi fetchApi;

  ProductBloc({required this.fetchApi}) : super(ProductInitialState()) {
    on<ProductLoadedEvent>((event, emit) async{
      emit(ProductInitialState());

      emit(ProductLoadingState());
      try{
        var data= await fetchApi.fetchData('');
          emit(ProductLoadedState(data));
      }catch(e){
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
