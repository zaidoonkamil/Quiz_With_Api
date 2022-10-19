import 'package:flutter/material.dart';
import 'package:simple_quiz2/utility/card_details.dart';

import '../screens/loading_screen.dart';

class DifficultyTile extends StatelessWidget {
  DifficultyTile({
    Key? key,
    required this.selectedIndex,
    required this.difficulty,
  }) : super(key: key);

  final int selectedIndex;
  final int difficulty;

  final List<String> level = ['Easy', 'Medium', 'Hard'];
  final List<String> levelLowercase = ['easy', 'medium', 'hard'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoadingScreen(
                  index: selectedIndex,
                  selectedDif: levelLowercase[difficulty],
                )));
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
          ],
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Text(
          level[difficulty],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
