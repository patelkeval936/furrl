import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furrl/bloc/home_page_bloc.dart';
import 'package:furrl/presentation/home_page/components/animated_product_card.dart';
import '../../../bloc/home_page_state.dart';

class AnimatedFrontProductCard extends StatelessWidget {
  const AnimatedFrontProductCard({Key? key,required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<HomePageBloc,HomePageState>(
      builder: (context, state) {
       return GestureDetector(
          onHorizontalDragStart: (details) {
            context.read<HomePageBloc>().
            changeAnimateCardTo(false);
          },
          onHorizontalDragUpdate: (details) {

            double pixelsOnLeft = state.cardCoordinates.dx + details.delta.dx;

            if (pixelsOnLeft > 0) {
              Offset offset = state.cardCoordinates;
              offset += details.delta;
              context.read<HomePageBloc>().changeCoordinatesTo(offset);
            }
          },
          onHorizontalDragEnd: (details) {
            if (state.cardCoordinates.dx < width * 0.3 && state.cardCoordinates.dx > 0) {

              context.read<HomePageBloc>().changeAnimateCardTo(true);
              context.read<HomePageBloc>().changeCoordinatesTo(Offset.zero);

            } else if (state.cardCoordinates.dx > width * 0.3) {

              context.read<HomePageBloc>().changeAnimateCardTo(true);
              context.read<HomePageBloc>().changeCoordinatesTo(Offset(width, 0));
              Future.delayed(const Duration(milliseconds: 400)).then((value) {
                context.read<HomePageBloc>().removeLast();
              });

            } else {
              //TODO:implement swipe left on product card
            }
          },
         child: AnimatedProductCard(index: index, isFront: true),
        );
      },
    );
  }
}
