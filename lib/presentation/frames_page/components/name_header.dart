
import 'package:flutter/material.dart';

import '../../../values/app_assets.dart';
import '../../../values/app_values.dart';

class NameHeader extends StatelessWidget {
  const NameHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(height * 0.05)),
                child: Container(
                  color: Colors.red,
                  child: Image.asset(
                    AppAssets.profilePicture,
                    height: height * 0.1,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '${frameData.firstName} ${frameData.lastName}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
