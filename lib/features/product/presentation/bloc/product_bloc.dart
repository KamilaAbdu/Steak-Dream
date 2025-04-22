import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await getProducts();
        emit(ProductLoaded(products));
      } catch (e, stack) {
        print('🔴 Error loading products: $e');
        print(stack);
        emit(ProductError("Ошибка загрузки продуктов"));
      }
    });
  }
}
