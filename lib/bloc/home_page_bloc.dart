import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../values/app_values.dart';
import '../presentation/home_page/model/product.dart';
import 'home_page_state.dart';

class HomePageBloc extends Cubit<HomePageState> {
  HomePageBloc()
      : super(HomePageState(
          productCards: products.reversed.toList().sublist(0, 3),
          cardCoordinates: Offset.zero,
          animateCard: false,
          currentPage: offers.length * 100,
        ));

  void changeCurrentPageTo(int index) {
    state.currentPage = index;
    emit(state.copyWith(currentPage: index));
  }

  void changeAnimateCardTo(bool change){
    state.animateCard = change;
    emit(state.copyWith(animateCard: state.animateCard));
  }

  void changeCoordinatesTo(Offset coordinates){
    state.cardCoordinates = coordinates;
    emit(state.copyWith(cardCoordinates: state.cardCoordinates));
  }

  void changeOffer() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 2), (timer) {
        if (state.controller.hasClients) {
          ++state.currentPage;
          state.controller.animateToPage(
            state.currentPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  void removeLast() {
    state.animateCard = false;
    state.productCards.removeLast();

    List<Product> newProductList = [];

    int index = Random().nextInt(6);
    Product product = Product(products[index].name, products[index].price, products[index].path);
    newProductList.add(product);

    newProductList.addAll(state.productCards);

    state.productCards = newProductList;
    state.cardCoordinates = const Offset(0, 0);

    emit(state.copyWith(productCards: state.productCards, cardCoordinates: state.cardCoordinates));
  }
}
