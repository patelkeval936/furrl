import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furrl/presentation/edit_frame/components/custom_app_bar.dart';
import 'package:furrl/bloc/home_page_bloc.dart';
import 'package:furrl/presentation/home_page/components/swipable_product.dart';
import '../../values/app_strings.dart';
import 'components/frame_post.dart';
import 'components/offer_slider.dart';
import 'components/stories_tab.dart';

class HomePage extends StatefulWidget {
  static const id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void didChangeDependencies() {
    context.read<HomePageBloc>().changeOffer();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(AppStrings.appName),
      body: SizedBox(
        width: width,
        height: height,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              OfferSlider(),
              StoriesTab(),
              SwipableProducts(),
              FramePost()
            ],
          ),
        ),
      ),
    );
  }
}
