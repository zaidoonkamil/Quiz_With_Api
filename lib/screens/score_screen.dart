import 'package:flutter/material.dart';
import 'package:fl_score_bar/fl_score_bar.dart';
import 'package:simple_quiz2/utility/card_details.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int index;
  const ScoreScreen({Key? key, required this.score, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconScoreBar(
            scoreIcon: Icons.star_rounded,
            iconColor: Colors.yellow,
            score: score / 3,
            maxScore: 3,
            readOnly: true,
          ),
          const SizedBox(height: 30),
          Text(
            '${score.toString()}/10',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: KprimaryColor,
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 0.3 * MediaQuery.of(context).size.width,
              height: 0.08 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: KprimaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 3),
                    blurRadius: 0.7,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
