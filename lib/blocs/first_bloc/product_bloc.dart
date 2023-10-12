import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductLoadedEvent, ProductLoadingState> {
  ProductBloc() : super(ProductLoadingState()) {
    on<ProductLoadedEvent>((event, emit) {
      
    });
  }
}
