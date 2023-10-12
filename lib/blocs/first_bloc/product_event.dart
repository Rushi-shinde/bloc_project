part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoadedEvent extends ProductEvent{
  @override

  List<Object?> get props => [];
}
