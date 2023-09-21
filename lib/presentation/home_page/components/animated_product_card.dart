import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furrl/bloc/home_page_bloc.dart';
import 'package:furrl/presentation/home_page/components/product_card.dart';

import '../../../bloc/home_page_state.dart';

class AnimatedProductCard extends StatelessWidget {
  const AnimatedProductCard({Key? key,required this.index,required this.isFront}) : super(key: key);
  final int index;
  final bool isFront;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<HomePageBloc,HomePageState>(
      builder: (context, state) {
        return AnimatedContainer(
          transform: Matrix4.identity()
            ..translate(
              isFront ?  state.cardCoordinates.dx - 20 :  -((20 * state.cardCoordinates.dx / width) - (20 * (1 - index))),
              isFront ? -((20 * state.cardCoordinates.dx / width) - 60.00) :  (20 * state.cardCoordinates.dx / width) + (20 * (index + 1)),
            ),
          duration: Duration(milliseconds: state.animateCard ? 400 : 0),
        child: ProductCard(product: state.productCards[index]),
        );
      },
    );
  }
}
