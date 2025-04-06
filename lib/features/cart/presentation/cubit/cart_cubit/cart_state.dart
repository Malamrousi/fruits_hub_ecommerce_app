part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}
final class CartProductAdd extends CartState {}
final class CartItemRemove extends CartState {}
