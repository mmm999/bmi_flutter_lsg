import 'dart:math';

// das wird man benötigen, wenn auf enum Gender zugegriffen wird
//import 'package:bmi/screens/calculator_screen.dart';

class BmiLogic {
  BmiLogic({required this.height, required this.weight});
  // -----------------------------------------------------------------------
  // hier muss der Konstruktor so angepasst werden, dass er das Attribut gender
  // bekommt, da male und female mit einberechnet werden sollen

  final int height;
  final int weight;
  // -----------------------------------------------------------------------
  //gender Attribut

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  // https://www.verival.de/blogs/ernaehrung/bmi-formel-berechnen
  // --------------------------------------------------------------
  String getResult() {
    // -------------------------------------------------------------
    // hier muss man die Werte überprüfen, abhängig vom gender Attribut
    // Tipp gender gleich  gender.female?

    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    // --------------------------------------------------------------
    // auch hier muss auf gender überprüft werden

    if (_bmi >= 25) {
      return 'Try to exercise more.\n 💪🚵🚴🏊🏇🏃';
    } else if (_bmi >= 17.5) {
      return 'Good job!\n 🍇🍉🍍🍒🌽';
    } else {
      return 'You can eat a bit more.\n 🍲🍱🍳🍗🍒🍎';
    }
  }
}
