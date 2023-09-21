
import 'package:flutter/material.dart';

import '../../../values/app_constants.dart';
import '../../../values/app_values.dart';

class ProductDetailAndTags extends StatelessWidget {
  const ProductDetailAndTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: Colors.white,
        width: width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Text(
                frameData.description,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16),
              child: Wrap(alignment: WrapAlignment.center, children: [
                ...frameData.tags.map((e) {
                  return Text(
                    '#$e ${frameData.tags.indexOf(e) != frameData.tags.length - 1 ? "|" : ''} ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryColor, height: 1.4),
                    textAlign: TextAlign.center,
                  );
                })
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
