
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home_page_bloc.dart';
import '../../../bloc/home_page_state.dart';
import '../../../values/app_constants.dart';
import 'animated_front_product_card.dart';
import 'animated_product_card.dart';

class SwipableProducts extends StatelessWidget {
  const SwipableProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: Colors.white,
        width: width,
        height: width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '#EasyLife',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    ...state.productCards.map((e) {
                      int index = state.productCards.indexOf(e);
                      int length = state.productCards.length;
                      return index == length - 1
                          ? AnimatedFrontProductCard(index: index)
                          : AnimatedProductCard(index: index, isFront: false);
                    })
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
