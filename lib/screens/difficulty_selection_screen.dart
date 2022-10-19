import 'package:flutter/material.dart';
import 'package:simple_quiz2/utility/card_details.dart';
import 'package:simple_quiz2/widgets/close_button.dart';
import 'package:simple_quiz2/widgets/difficulty_tile.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({Key? key, required this.selectedIndex}) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                  height: 10
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  const [
                  CustomCloseButton(),
                ],
              ),
              const SizedBox(
                  height: 10
              ),
              Text(
                cardDetailList[selectedIndex].title,
                style: const TextStyle(
                  color: KprimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                ),
              ),
              Hero(
                tag: cardDetailList[selectedIndex].iconTag,
                child: Image.asset(
                  cardDetailList[selectedIndex].iconAssetName,
                  height: 300,
                  width: 300,
                ),
              ),
              Column(
                children: const [
                  Text(
                    'Select Difficulty',
                    style: TextStyle(
                        color: KprimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      height: 5
                  ),
                  Text(
                    'Harder the Difficulty, Lesser the Time per question.',
                    style: TextStyle(
                        color: KprimarySupTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                  height: 20
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DifficultyTile(selectedIndex: selectedIndex, difficulty: 0),
                  const SizedBox(height: 20),
                  DifficultyTile(selectedIndex: selectedIndex, difficulty: 1),
                  const SizedBox(height: 20),
                  DifficultyTile(selectedIndex: selectedIndex, difficulty: 2),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
