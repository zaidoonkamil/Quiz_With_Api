import 'package:flutter/material.dart';
import 'package:simple_quiz2/utility/card_details.dart';

// ignore: must_be_immutable
class CustomCloseButton extends StatelessWidget {
   const CustomCloseButton({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: KprimaryColor),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.close_rounded,
          color: KprimarySupTextColor ,
          size: 30,
        ),
      ),
    );
  }
}
