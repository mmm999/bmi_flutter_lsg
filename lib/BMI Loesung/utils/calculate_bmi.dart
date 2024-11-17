import 'dart:math';

import 'package:bmi/screens/calculator_screen.dart';

class BmiLogic {
  //BmiLogic({required this.height, required this.weight});
  // -----------------------------------------------------------------------
  BmiLogic({required this.height, required this.weight, required this.gender});

  final int height;
  final int weight;
  // -----------------------------------------------------------------------
  Gender gender;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  // https://www.verival.de/blogs/ernaehrung/bmi-formel-berechnen
  // --------------------------------------------------------------
  String getResult() {
    if (gender == Gender.female) {
      if (_bmi >= 25) {
        return 'Overweight >= 25';
      } else if (_bmi >= 17.5) {
        return 'Normal 17.5 - 24';
      } else {
        return 'Underweight < 17.5';
      }
    } else {
      if (_bmi >= 25) {
        return 'Overweight >= 25';
      } else if (_bmi >= 18.5) {
        return 'Normal 18.5 - 24.9';
      } else {
        return 'Underweight < 18.5';
      }
    }
/*
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }*/
  }

  String getInterpretation() {
    // ----------------------------
    if (gender == Gender.female) {
      if (_bmi >= 25) {
        return 'Try to exercise more.\n 💪🚵🚴🏊🏇🏃';
      } else if (_bmi >= 17.5) {
        return 'Good job!\n 🍇🍉🍍🍒🌽';
      } else {
        return 'You can eat a bit more.\n 🍲🍱🍳🍗🍒🍎';
      }
    }
    //--------------------------------
    else if (_bmi >= 25) {
      return 'Try to exercise more.\n 💪🚵🚴🏊🏇🏃';
    } else if (_bmi >= 18.5) {
      return 'Good job!\n 🍇🍉🍍🍒🌽';
    } else {
      return 'You can eat a bit more.\n 🍲🍱🍳🍗🍒🍎';
    }
  }
}
