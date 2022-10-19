import 'package:flutter/material.dart';
import 'package:simple_quiz2/utility/card_details.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final Function() onPressed;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: FloatingActionButton.extended(
        backgroundColor: KprimaryColor,
        icon: const Icon(
          Icons.exit_to_app,
          color: Colors.white,
          size: 30,
        ),
        onPressed: onPressed,
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
