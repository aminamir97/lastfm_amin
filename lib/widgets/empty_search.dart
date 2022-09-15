import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/nosearch.png",
          width: 250.w,
        ),
        Text(
          "No Albums Found , search now !",
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
