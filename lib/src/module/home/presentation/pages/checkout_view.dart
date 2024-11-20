import 'dart:developer';

import 'package:aziko/src/module/home/presentation/pages/app_colors.dart';
import 'package:aziko/src/module/home/presentation/pages/app_text_styles.dart';
import 'package:aziko/src/module/home/presentation/pages/checkout_payment_card_widget.dart';
import 'package:aziko/src/module/home/presentation/pages/checkout_shipping_address_card_widget.dart';
import 'package:aziko/src/module/home/presentation/pages/checkout_title_widget.dart';
import 'package:aziko/src/module/home/presentation/pages/custom_app_bar.dart';
import 'package:aziko/src/module/home/presentation/pages/custom_button.dart';
import 'package:aziko/src/module/home/presentation/pages/delivery_card_toggle_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class MobileCheckoutView extends StatelessWidget {
//   const MobileCheckoutView({
//     required this.allProducts,
//     required this.totalAmount,
//     required this.userId,
//     Key? key,
//   }) : super(key: key);

//   final List<BagEntity> allProducts;
//   final String totalAmount;
//   final String userId;

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<BagBloc, BagState>(
//       listener: (context, state) {
//         if (state is AddedOrderState) {
//           BlocProvider.of<BagBloc>(context).add(
//             ClearProductCartEvent(),
//           );
//         }
//         if (state is ClearedProductCartState) {
//           //context.goNamed(AppPage.success.toName);
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const SuccessViewSecond(),
//             ),
//           );
//         }
//       },
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) =>
//                 sl<ProfileBloc>()..add(GetUserInfoEvent(userId)),
//           ),
//         ],
//         child: BlocListener<ProfileBloc, ProfileState>(
//           listener: (context, state) {
//             if (state is ProfileInitial) {
//               BlocProvider.of<ProfileBloc>(context)
//                   .add(GetUserInfoEvent(userId));
//             }
//           },
//           child: BlocBuilder<ProfileBloc, ProfileState>(
//             builder: (context, state) {
//               if (state is LoadingProfileState) {
//                 return const LoadingWidget();
//               } else if (state is LoadedUserProfileState) {
//                 final ShippingAddressEntity shippingAddress;
//                 final PaymentCardEntity paymentCard;
//                 shippingAddress = state.user.shippingAddresses!.isNotEmpty
//                     ? state.user.shippingAddresses!
//                         .firstWhere((e) => e.isCheked == true)
//                     : ShippingAddressEntity();
//                 paymentCard = state.user.paymentMethods!.isNotEmpty
//                     ? state.user.paymentMethods!
//                         .firstWhere((e) => e.isCheked == true)
//                     : PaymentCardEntity();

//                 return NestedCheckoutView(
//                   allProducts: allProducts,
//                   totalAmount: double.parse(totalAmount),
//                   user: state.user,
//                   shippingAddress: shippingAddress,
//                   paymentCard: paymentCard,
//                 );
//               }
//               return const Center(
//                   child: Text(
//                 'Some Error',
//                 style: TextStyle(color: Colors.black),
//               ));
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class MobileCheckoutView extends StatefulWidget {
  //final double totalAmount;

  const MobileCheckoutView({
    super.key,
    //required this.totalAmount,
  });

  @override
  State<MobileCheckoutView> createState() => _MobileCheckoutViewState();
}

class _MobileCheckoutViewState extends State<MobileCheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'Checkout',
        showSearchBtn: false,
        showBackBtn: true,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 20), // 36
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Shipping address
            const CheckoutTitleWidget(text: 'Shipping address'),
            15.verticalSpace,
            //10.verticalSpace,
            CheckoutShippingAddressCardWidget(),
            57.verticalSpace,
            //50.verticalSpace,

            /// Payment method
            CheckoutPaymentCardWidget(

                //paymentCard: PaymentCardEntity(),
                ),
            57.verticalSpace,
            //50.verticalSpace,

            /// Delivery method
            const CheckoutTitleWidget(text: 'Delivery method'),
            15.verticalSpace,
            //10.verticalSpace,
            DeliveryCardToggleButton(),
            40.verticalSpace,

            /// Order info
            buildOrder(text: 'Order:', value: 200),
            14.verticalSpace,
            //10.verticalSpace,
            buildOrder(text: 'Delivery:', value: 20),
            14.verticalSpace,
            //10.verticalSpace,
            buildOrder(text: 'Summary:', value: (200 + 20).toInt()),
            40.verticalSpace,
            //30.verticalSpace,

            /// Button
            CustomButton(
              onPressed: () {},
              text: 'SUBMIT ORDER',
            ),
          ],
        ),
      ),
    );
  }

  buildOrder({required String text, required int value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.grey16,
        ),
        Text(
          '$value\$',
          style: AppTextStyles.black16Bold,
        ),
      ],
    );
  }
}
