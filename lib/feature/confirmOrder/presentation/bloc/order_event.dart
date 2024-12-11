class OrderEvent  {}

class ConfirmOrderEvent extends OrderEvent{
  final String date;
  final String time;
  final String addressId;
  final String payType;

  ConfirmOrderEvent({required this.date, required this.time, required this.addressId, required this.payType});
}