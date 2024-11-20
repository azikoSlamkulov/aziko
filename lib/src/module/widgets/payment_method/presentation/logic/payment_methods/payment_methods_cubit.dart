import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

part 'payment_methods_state.dart';

class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  // final AddNewPaymentCard addNewCard;
  // final GetAllPaymentCards getAllCards;
  // final SelectDefaultPaymentCard selectDefaultCard;
  PaymentMethodsCubit(
      //{
      // required this.addNewCard,
      // required this.getAllCards,
      // required this.selectDefaultCard,
      //}
      )
      : super(PaymentMethodsInitial());

  List<PaymentCardEntity> allCards = [];

  void getAllPaymentCards() async {
    emit(LoadingPaymentMethodsState());
    // final allPaymentCards =
    //     await getAllCards(GetAllCardsParams(userId: userId));
    // allPaymentCards.fold(
    //   (error) => emit(const PaymentCardFailureState('')),
    //   (allPaymentCards) => emit(LoadedAllPaymentCardsState(allPaymentCards)),
    // );

    emit(LoadedAllPaymentCardsState(allCards));
  }

  void addNewPaymentCard({required PaymentCardEntity newCard}) async {
    // emit(LoadingPaymentMethodsState());
    // final isAdded = await addNewCard(AddPaymentCardParams(
    //   newPaymentCard: newCard,
    // ));
    // isAdded.fold(
    //   (error) => emit(const PaymentCardFailureState('')),
    //   (isAdded) => emit(AddedPaymentCardState(isAdded)),
    // );

    allCards.add(newCard);

    emit(AddedPaymentCardState(true));
  }

  // void selectDefaultPaymentCard({
  //   required String userId,
  //   required String paymentCardId,
  // }) async {
  //   emit(LoadingPaymentMethodsState());
  //   final isSelected = await selectDefaultCard(SelectDefaultCardParams(
  //     userId: userId,
  //     paymentCardId: paymentCardId,
  //   ));
  //   isSelected.fold(
  //     (error) => emit(const PaymentCardFailureState('')),
  //     (isSelected) => emit(SelectedPaymentCardState(isSelected)),
  //   );
  // }
}
