
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/features/cart/domain/entities/cart_item.dart';
import 'package:steak_dream/features/cart/domain/repositories/cart_repository.dart';
import 'package:steak_dream/features/cart/domain/usecase/add_to_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCart addToCart;
  final CartRepository repository;

  CartBloc(this.addToCart, this.repository) : super(CartInitial()) {
    on<AddItemToCart>((event, emit) async {
      await addToCart(event.item);
      final updatedItems = await repository.getItems();
      emit(CartUpdated(updatedItems));
    });
  }
}
