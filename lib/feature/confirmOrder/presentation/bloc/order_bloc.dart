import 'package:bloc/bloc.dart';
import 'package:t7mara/feature/confirmOrder/data/repo/order_repo.dart';
import 'package:t7mara/feature/confirmOrder/presentation/bloc/order_event.dart';
import 'package:t7mara/feature/confirmOrder/presentation/bloc/order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<ConfirmOrderEvent>(confirmOrder);
  }
  //confirm order
  Future<void> confirmOrder(
      ConfirmOrderEvent event, Emitter<OrderState> emit) async {
    emit(ConfirmOrderLoadingState());
    //api
    await OrderRepo.confirmOrderRepo(
      addressId: event.addressId,
      date:event.date ,
      payType: event.payType,
      time:event.time ,
    ).then(
      (value) {
        if (value==true) {
          emit(ConfirmOrderLoadedState());
        } else {
          emit(ConfirmOrderErrorState());
        }
      },
    );
  }
}

