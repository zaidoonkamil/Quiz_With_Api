import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:simple_quiz2/services/quiz_maker.dart';
import 'package:simple_quiz2/utility/card_details.dart';
import 'package:simple_quiz2/widgets/close_button.dart';

import 'score_screen.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({required this.questionData, required this.categoryIndex});

  final questionData;
  final int categoryIndex;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
    quizMaker.getList(widget.questionData);
  }

  final CountDownController _controller = CountDownController();

  QuizMaker quizMaker = QuizMaker();
  int questionNumber = 0;

  bool isAbsorbing = false;

  final int duration = 10;

  List<Color> optionColor = [
    KprimaryColor,
    KprimaryColor,
    KprimaryColor,
    KprimaryColor
  ];

  List<Widget> buildOptions(int i) {
    List<String> options = quizMaker.getOptions(i);

    List<Widget> Options = [];

    for (int j = 0; j < 4; j++) {
      Options.add(OptionWidget(
        widget: widget,
        option: options[j],
        optionColor: optionColor[j],
        onTap: () async {
          _controller.pause();
          if (quizMaker.isCorrect(i, j)) {
            setState(() {
              optionColor[j] = Colors.green;
              isAbsorbing = true;
            });
            quizMaker.increaseScore();
          } else {
            setState(() {
              optionColor[j] = const Color(0xFF00099D);
              optionColor[quizMaker.getCorrectIndex(i)] = Colors.green;
              isAbsorbing = true;
            });
          }
          await Future.delayed(
              const Duration(seconds: 1, milliseconds: 30), () {});
          if (questionNumber < 9) {
            setState(() {
              optionColor[j] = KprimaryColor;
              optionColor[quizMaker.getCorrectIndex(i)] = KprimaryColor;
              questionNumber++;
              isAbsorbing = false;
            });
            _controller.restart();
          } else {
            Navigator.pop(context);
            Navigator.pop(context);
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScoreScreen(
                  score: quizMaker.getScore(),
                  index: widget.categoryIndex,
                ),
              ),
            );
          }
        },
      ));
    }
    return Options;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomCloseButton(),
                  CircularCountDownTimer(
                    width: 50,
                    height: 50,
                    duration: duration,
                    fillColor: Colors.grey.withOpacity(0.8),
                    ringColor: KprimaryColor,
                    textStyle: const TextStyle(
                      fontSize: 25,
                      color: KprimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    autoStart: true,
                    isReverse: true,
                    controller: _controller,
                    onComplete: () {
                      if (questionNumber < 9) {
                        setState(() {
                          questionNumber++;
                        });
                        _controller.restart();
                      } else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScoreScreen(
                              score: quizMaker.getScore(),
                              index: widget.categoryIndex,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite_sharp,
                      color: KprimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'question ${(questionNumber + 1).toString()} of 10',
                      style: const TextStyle(
                        color: KprimarySupTextColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // ignore: prefer_const_constructors
                    Text(
                      quizMaker.getQuestion(questionNumber),
                      style: const TextStyle(
                        color: KprimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
              ...buildOptions(questionNumber),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget(
      {Key? key,
      required this.widget,
      required this.option,
      required this.onTap,
      required this.optionColor})
      : super(key: key);

  final QuestionScreen widget;
  final String option;
  final VoidCallback onTap;
  final Color optionColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 8),
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: optionColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 3),
                blurRadius: 3,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          child: Text(
            option,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
