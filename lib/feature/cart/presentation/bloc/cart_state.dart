class CartState {}

class CartInitial extends CartState {}

//show cart
class ShowCartLoadingState extends CartState {}

class ShowCartLoadedState extends CartState {}

class ShowCartErrorState extends CartState {}

//store product in cart
class StoreProductLoadingState extends CartState {}

class StoreProductLoadedState extends CartState {}

class StoreProductErrorState extends CartState {}

//delete from cart
class DeleteFromCartLoadingState extends CartState {}

class DeleteFromCartLoadedState extends CartState {}

class DeleteFromCartErrorState extends CartState {}

//update cart product quantity
class UpdateCartLoadingState extends CartState {}

class UpdateCartLoadedState extends CartState {}

class UpdateCartErrorState extends CartState {}

