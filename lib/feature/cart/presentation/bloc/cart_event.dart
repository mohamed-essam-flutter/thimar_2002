class CartEvent {}

class ShowCartEvent extends CartEvent {}

class StoreProductEvent extends CartEvent {
  final String id;
  final String amount;

  StoreProductEvent({required this.id, required this.amount});
}

class DeleteFromCartEvent extends CartEvent{
  final int id;

  DeleteFromCartEvent({required this.id});
}

class UpdateCartEvent extends CartEvent{
  final String amount;
  final int id;

  UpdateCartEvent({required this.amount, required this.id});

}