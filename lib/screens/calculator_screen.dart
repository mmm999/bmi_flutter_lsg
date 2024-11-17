import 'result_screen.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/utils/calculate_bmi.dart';

import 'package:fluttertoast/fluttertoast.dart'; //-------------------------------

enum Gender {
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  //Gender? selectedGender; //= Gender.male; -------------------------
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 80;
  int age = 50;

  // von mir
  bool isAgeActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        //centerTitle: true, ------------------------------------------
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                // männlich
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      // Farbe aktiv oder inaktiv setzen
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: const IconContent(
                          //icon: FontAwesomeIcons.mars, // ext. Bibliothekl ----------------
                          icon: FontAwesomeIcons.person, // ext. Bibliothekl
                          label: 'MALE')),
                ),
                // Weiblich
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const IconContent(
                      icon:
                          FontAwesomeIcons.personDress, // person, ------------
                      //icon: FontAwesomeIcons.venus, // ext. Bibliothekl
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('  $height', style: kNumberTextStyle),
                      const Text(' cm', style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),

                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      //overlayShape:
                      //  const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 200.0,
                      // --------------------------------------------
                      activeColor: const Color(0xFFEB1555),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    //----------------------------------------------
                    //colour: kActiveCardColour,
                    colour: isAgeActivated
                        ? kActiveCardColour
                        : kInactiveCardColour,

                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    // ----------------------------
                                    if (isAgeActivated) age--;
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    // -------------------------
                                    if (isAgeActivated) age++;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),

                    // von mir erweitert den Inhalt
                    onPress: () {
                      // ----------------------------------------------------
                      isAgeActivated = !isAgeActivated;
//--------------------------------------------
                      if (isAgeActivated) {
                        Fluttertoast.showToast(
                          msg: 'Wert wird nicht mit einberechnet!',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          fontSize: 20,
                          textColor: Colors.white,
                          backgroundColor: Colors.red,
                        );
                      }
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              // BmiLogic calc = BmiLogic(height: height, weight: weight);
              BmiLogic calc = BmiLogic(
                  height: height, weight: weight, gender: selectedGender);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
