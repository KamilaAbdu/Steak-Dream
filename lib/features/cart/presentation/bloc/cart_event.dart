part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddItemToCart extends CartEvent {
  final CartItem item;

  const AddItemToCart(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItemFromCart extends CartEvent {
  final String productId;

  const RemoveItemFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

class LoadCart extends CartEvent {
  @override
  List<Object?> get props => [];
}
