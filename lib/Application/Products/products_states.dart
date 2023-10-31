import 'package:stc_health/Domain/Models/product_model.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {

  final List<Product> products;

  ProductLoadedState(this.products);

}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);
}
