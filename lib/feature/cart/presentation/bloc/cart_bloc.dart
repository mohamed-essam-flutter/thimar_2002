import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:t7mara/feature/cart/data/models/response/show_cart_response_models/show_cart_response_models.dart';
import 'package:t7mara/feature/cart/data/repo/cart_repo.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_event.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    //
    on<ShowCartEvent>(showCart);
    on<StoreProductEvent>(storeProduct);
    on<DeleteFromCartEvent>(deleteFromCart);
    on<UpdateCartEvent>(updateCart);
  }
  ShowCartResponseModels? showCartResponseModels;

  //show cart
  Future<void> showCart(ShowCartEvent event, Emitter<CartState> emit) async {
    emit(ShowCartLoadingState());
    //api
    await CartRepo.showCartRepo().then(
      (value) {
        if (value != null) {
          showCartResponseModels=value;
          log('======store');
          emit(ShowCartLoadedState());
        } else {
          emit(ShowCartErrorState());
        }
      },
    );
  }

  //store product in cart
  Future<void> storeProduct(
      StoreProductEvent event, Emitter<CartState> emit) async {
    emit(StoreProductLoadingState());
    //api
    await CartRepo.storeProductRepo(event.id, event.amount).then(
      (value) {
        if (value != null) {
          emit(StoreProductLoadedState());
        } else {
          emit(StoreProductErrorState());
        }
      },
    );
  }

  //delete from cart
    Future<void> deleteFromCart(
      DeleteFromCartEvent event, Emitter<CartState> emit) async {
    emit(DeleteFromCartLoadingState());
    //api
    await CartRepo.deleteFromCartRepo(event.id).then(
      (value) {
        if (value==true) {
          emit(DeleteFromCartLoadedState());
        } else {
          emit(DeleteFromCartErrorState());
        }
      },
    );
  }

  //update cart product quantity
  
   Future<void> updateCart(
      UpdateCartEvent event, Emitter<CartState> emit) async {
    emit(UpdateCartLoadingState());
    //api
    await CartRepo.updateCartRepo(
      amount: event.amount,id: event.id
    ).then(
      (value) {
        if (value==true) {
          emit(UpdateCartLoadedState());
        } else {
          emit(UpdateCartErrorState());
        }
      },
    );
  }
}
