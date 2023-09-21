import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home_page_bloc.dart';
import '../../../bloc/home_page_state.dart';
import '../../../values/app_constants.dart';
import '../../../values/app_values.dart';

class OfferSlider extends StatelessWidget {
  const OfferSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.primaryColor,
      width: width,
      height: 34,
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return PageView.builder(
            controller: state.controller,
            onPageChanged: (value) {
              context.read<HomePageBloc>().changeCurrentPageTo(value);
            },
            itemBuilder: (context, index) {
              return Center(
                  child: Text(
                offers[index % offers.length],
                style: const TextStyle(color: Colors.white),
              ));
            },
          );
        },
      ),
    );
  }
}
