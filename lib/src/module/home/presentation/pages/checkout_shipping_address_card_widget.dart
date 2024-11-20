import 'package:aziko/src/module/home/presentation/pages/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class CheckoutShippingAddressCardWidget extends StatefulWidget {
  const CheckoutShippingAddressCardWidget({
    // required this.user,
    // required this.shippingAddress,
    super.key,
  });

  // final UserEntity user;
  // final ShippingAddressEntity shippingAddress;

  @override
  State<CheckoutShippingAddressCardWidget> createState() =>
      _CheckoutShippingAddressCardWidgetState();
}

class _CheckoutShippingAddressCardWidgetState
    extends State<CheckoutShippingAddressCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 108.w,
      //width: 343.w,
      child: Card(
        color: Colors.white,
        child: Padding(
          // padding: REdgeInsets.symmetric(horizontal: 25, vertical: 18),
          padding: REdgeInsets.symmetric(horizontal: 25, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Azat Slamkulov', style: AppTextStyles.black14Bold),
                  InkWell(
                    // onTap: () async {
                    //   final isTrue = await Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => MobileShippingAddressView(
                    //         user: widget.user,
                    //         //isCheckout: true,
                    //       ),
                    //     ),
                    //   );
                    //   if (isTrue) {
                    //     setState(() {
                    //       context.read<ProfileBloc>().add(
                    //             GetUserInfoEvent(widget.user.userID!),
                    //           );
                    //     });
                    //   }
                    // },
                    child: Text('Change', style: AppTextStyles.red14),
                  ),
                ],
              ),
              12.verticalSpace,
              Text(
                'Progorodnoe, 23-8',
                style: AppTextStyles.black14,
              ),
              5.verticalSpace,
              Text(
                'Bishkek, Kyrgyzstan',
                style: AppTextStyles.black14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
