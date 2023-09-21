
import 'package:flutter/material.dart';

import '../model/story.dart';

class StoriesTab extends StatelessWidget {
  const StoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      width: width,
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...stories.map((e) {
              return Padding(
                padding:
                EdgeInsets.only(left: stories.indexOf(e) == 0 ? 16 : 4, right: stories.indexOf(e) == stories.length - 1 ? 16 : 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 64,
                      width: 64,
                      child: Image.asset(
                        e.path,
                        height: 64,
                        width: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      e.title,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
