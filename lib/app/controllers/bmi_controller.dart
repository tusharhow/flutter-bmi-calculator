import 'package:get/get.dart';

class BMIController extends GetxController {
  // feet inches to centimeters conversion
  double feetToCm = 0.0;
  double inchesToCm = 0.0;
  double totalCm = 0.0;
  List<String> gender = ["Male", "Female"];

  String? selectedGender;

  double height = 0.0;
  double weight = 0.0;
  double age = 0.0;

  void changeGender(String? value) {
    selectedGender = value;
    update();
  }

  void increaseWeight() {
    weight++;
    update();
  }

  void decreaseWeight() {
    if (weight > 0) {
      weight--;
      update();
    }
  }

  double get feet => feetToCm / 30.48;
  void changeFeetSlider(double value) {
    feetToCm = value * 30.48;
    totalCm = feetToCm + inchesToCm;
    update();
  }

  double get inches => inchesToCm / 2.54;
  void changeInchesSlider(double value) {
    inchesToCm = value * 2.54;
    totalCm = feetToCm + inchesToCm;
    update();
  }

  // bmi
  double bmi = 0.0;
  //  bmi = weight / ((totalCm / 100) * (totalCm / 100));
  calculateBMI(double totalCm, double weight, bool isMale) {
    bmi = weight / ((totalCm / 100) * (totalCm / 100));
    if (isMale) {
      if (bmi < 18.5) {
        print('Underweight');
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        print('Normal');
      } else if (bmi >= 25 && bmi <= 29.9) {
        print('Overweight');
      } else if (bmi >= 30) {
        print('Obese');
      }
    } else {
      if (bmi < 18.5) {
        print('Underweight');
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        print('Normal');
      } else if (bmi >= 25 && bmi <= 29.9) {
        print('Overweight');
      } else if (bmi >= 30) {
        print('Obese');
      }
    }
    update();
    print(bmi);
  }
}
