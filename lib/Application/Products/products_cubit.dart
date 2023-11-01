import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stc_health/Application/Products/products_states.dart';
import 'package:stc_health/Data/Repository/product_repo.dart';


class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;


  ProductCubit({required this.repository}) : super(ProductLoadingState());
  Future<void>fetchProducts() async {
    
    try {
      final products = await repository.fetchProducts();
      emit(ProductLoadedState(products));
    } catch (e) {
      emit(ProductErrorState('Failed to fetch products: $e'));
    }
  }
}
