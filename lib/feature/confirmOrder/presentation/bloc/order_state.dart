class OrderState{}

class OrderInitial extends OrderState {}

//confirm order
class ConfirmOrderLoadingState extends OrderState {}

class ConfirmOrderLoadedState extends OrderState {}

class ConfirmOrderErrorState extends OrderState {}