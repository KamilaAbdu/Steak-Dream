part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartUpdated extends CartState {
  final List<CartItem> items;

  const CartUpdated(this.items);

  @override
  List<Object?> get props => [items];
}