part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}
class ProductInitialState extends ProductState {

}

class ProductLoadingState extends ProductState {

}

class ProductLoadedState extends ProductState {
  final List<ProductsModel> productsModel;

  const ProductLoadedState(this.productsModel);

  @override
  List<Object> get props => [productsModel];
}
class ProductErrorState extends ProductState {
  final String errorMsg;
  const ProductErrorState(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];

}

