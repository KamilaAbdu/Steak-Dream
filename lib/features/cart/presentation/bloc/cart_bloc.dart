import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/usecase/add_to_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCart addToCart;
  final CartRepository repository;

  CartBloc({required this.addToCart, required this.repository}) : super(CartInitial()) {
    on<AddItemToCart>((event, emit) async {
      await addToCart(event.item);
      final updatedItems = await repository.getItems();
      emit(CartUpdated(updatedItems));
    });

    on<LoadCart>((event, emit) async {
      final items = await repository.getItems();
      emit(CartUpdated(items));
    });

    on<RemoveItemFromCart>((event, emit) async {
      await repository.remove(event.productId);
      final updatedItems = await repository.getItems();
      emit(CartUpdated(updatedItems));
    });
  }
}
