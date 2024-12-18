import 'package:flutter/material.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          // mittlerer Teil: Resultat und Intepretation
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText.toUpperCase(), style: kResultTextStyle),
                  // BMI Wert
                  Text(bmiResult, style: kBMITextStyle),
                  Text(interpretation,
                      style: kBodyTextStyle, textAlign: TextAlign.center),
                ],
              ),
              onPress: () {},
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
