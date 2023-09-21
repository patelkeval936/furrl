import 'package:flutter/material.dart';
import 'package:furrl/presentation/home_page/model/product.dart';
import '../../../values/app_assets.dart';
import '../../../values/app_constants.dart';

class ProductCard extends StatelessWidget {

  const ProductCard({Key? key,required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            product.path,
            height: width * 0.8,
            width: width * 0.8,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "Rs. ${product.price}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.iconButtonBackground,
                child: Image.asset(
                  AppAssets.bagIcon,
                  width: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6,),
              CircleAvatar(
                backgroundColor: AppColors.iconButtonBackground,
                child: Image.asset(
                  AppAssets.wishlistIcon,
                  width: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
