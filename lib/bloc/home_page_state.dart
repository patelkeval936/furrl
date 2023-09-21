import 'package:flutter/material.dart';
import '../presentation/home_page/model/product.dart';

class HomePageState {
  Offset cardCoordinates;
  List<Product> productCards;
  bool animateCard = false;
  int currentPage;
  PageController controller;

  HomePageState({
    required this.cardCoordinates,
    required this.productCards,
    required this.animateCard,
    required this.currentPage,
  }) : controller = PageController(initialPage: currentPage);

  HomePageState copyWith({Offset? cardCoordinates, List<Product>? productCards, bool? animateCard, int? currentPage}) {
    return HomePageState(
        cardCoordinates: cardCoordinates ?? this.cardCoordinates,
        productCards: productCards ?? this.productCards,
        animateCard: animateCard ?? this.animateCard,
        currentPage: currentPage ?? this.currentPage);
  }
}
