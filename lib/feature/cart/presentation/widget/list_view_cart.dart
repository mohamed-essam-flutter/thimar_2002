import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t7mara/core/utils/text.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_event.dart';
import 'package:t7mara/feature/cart/presentation/bloc/cart_state.dart';

class list_view_cart extends StatefulWidget {
  const list_view_cart({
    super.key,
  });

  @override
  State<list_view_cart> createState() => _list_view_cartState();
}

class _list_view_cartState extends State<list_view_cart> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if(state is DeleteFromCartLoadedState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:Text('تم الحذف',style: getHeadlineTextStyle(),) 
            )
          );
        }
      },
      buildWhen: (previous, current) => 
      current is ShowCartLoadedState||current is ShowCartLoadingState ,
      builder: (context, state) {
        if (state is ShowCartLoadedState) {
          var cartData = context.read<CartBloc>().showCartResponseModels?.data;
          return ListView.builder(
            itemCount: cartData?.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 94.h,
                width: double.infinity,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                      leading: SizedBox(
                        height: 80,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            cartData?[index].image??"",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        cartData?[index].title ?? "kk",
                        style: getHeadlineTextStyle(),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cartData?[index].price}ر.س',
                            style: getHeadlineTextStyle(),
                          ),
                          Container(
                            // width: 138.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff9fbf7)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FloatingActionButton.small(
                                  heroTag: null,
                                  onPressed: () {
                                    setState(() {
                                      context.read<CartBloc>().add(UpdateCartEvent(
                                        amount:((cartData![index].amount!)+1).toString() ,
                                         id: cartData[index].id!));
                                      context.read<CartBloc>().add(ShowCartEvent());   
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                ),
                                Text(
                                  '  ${cartData?[index].amount}   ',
                                  style: getHeadlineTextStyle(),
                                ),
                                FloatingActionButton.small(
                                  heroTag: null,
                                  onPressed: () {
                                     setState(() {
                                      context.read<CartBloc>().add(UpdateCartEvent(
                                        amount:((cartData![index].amount!)-1).toString(),
                                         id: cartData[index].id!));
                                         context.read<CartBloc>().add(ShowCartEvent());
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            context.read<CartBloc>().add(DeleteFromCartEvent(id: cartData![index].id!));
                            context.read<CartBloc>().add(ShowCartEvent());
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/delete.svg',
                          fit: BoxFit.fill,
                          height: 25.h,
                          width: 25.w,
                        ),
                      )),
                ),
              );
            },
          );
        } else  {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
