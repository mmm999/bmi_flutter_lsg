import 'result_screen.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/utils/calculate_bmi.dart';

// Das importieren, um Toast-Meldungen zu generieren
// import 'package:fluttertoast/fluttertoast.dart';

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
  // ------------------------------------------------------------------
  // hier mit einem Standardwert versehen und none-null-able machen
  Gender? selectedGender;

  int height = 180;
  int weight = 80;
  int age = 50;

  // -------------------------------
  // ein boolean-Wert um zu checken ob age akiv auf false setzen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        // Titel zentrieren
      ),
      body: Column(
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
                          // person icon nutzen, Bibliothekl ----------------
                          icon: FontAwesomeIcons.mars,
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
                          // personDress icon nutzen, Bibliothekl ----------------
                          FontAwesomeIcons.venus,
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
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 200.0,
                      // --------------------------------------------
                      // akive Farbe wählen mit z.B. 0xFFEB1555

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
                    colour: kActiveCardColour, // dieser muss geändert werden
                    // entweder kActiveCardColour oder kInactiveCardColour setzen
                    // in Abhängigkeit von dem boolean, der oben definiert wurde

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
                                    // nur wenn age aktiv gesetzt ist
                                    age--;
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
                                    // ----------------------------
                                    // nur wenn age aktiv gesetzt ist
                                    age++;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),

                    // von mir erweitert den Inhalt
                    onPress: () {
                      // ----------------------------------------------------
                      // den boolean-Wert bzgl. age aktivität umpolen
                      // also a = !a;
                      // damit es be jedem Drücken zwischen aktiv und inaktiv switcht

                      //--------------------------------------------
                      // wenn age aktiv ist
                      // dann das einfügen
                      /*Fluttertoast.showToast(
                        msg: 'Wert wird nicht mit einberechnet!',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        fontSize: 20,
                        textColor: Colors.// Farbe wählen,
                        backgroundColor: Colors.// Farbe wählen,
                      );*/

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
              // hier den Konstruktor um ein Parameter gender erweitern
              // wichtig, da der Wert zur Berechnung hinzugefügt wird
              BmiLogic calc = BmiLogic(height: height, weight: weight);

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
