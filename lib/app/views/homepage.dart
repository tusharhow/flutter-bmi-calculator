import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/app/components/icon_content.dart';
import 'package:flutter_bmi_calculator/app/controllers/bmi_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../components/reusable_card.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: GetBuilder<BMIController>(
          init: BMIController(),
          builder: (controller) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.gender.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: controller.gender.length),
                    itemBuilder: ((context, index) {
                      final gender = controller.gender[index];
                      return GestureDetector(
                        onTap: () {
                          controller.changeGender(gender);
                        },
                        child: ReusableCard(
                          colour: gender == controller.selectedGender
                              ? const Color(0xFF1D1E33)
                              : const Color(0xFF111328),
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.venus,
                            label: gender,
                          ),
                        ),
                      );
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                controller.weight
                                    .toString()
                                    .replaceAll(".0", ''),
                                style: kDigitTextStyle,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'kg',
                                style: klabelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.decreaseWeight();
                                  },
                                  icon: const Icon(FontAwesomeIcons.minus,
                                      color: Colors.white54)),
                              const SizedBox(
                                width: 15.0,
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.increaseWeight();
                                },
                                icon: const Icon(FontAwesomeIcons.plus,
                                    color: Colors.white54),
                              ),
                            ],
                          ),
                          // SliderTheme(
                          //   data: SliderTheme.of(context).copyWith(
                          //     activeTrackColor: Colors.white,
                          //     inactiveTrackColor: ksliderInactiveColor,
                          //     thumbColor: Color(0xFFEB1555),
                          //     overlayColor: Color(0x29EB1555),
                          //     thumbShape:
                          //         RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          //     overlayShape:
                          //         RoundSliderOverlayShape(overlayRadius: 35.0),
                          //   ),
                          //   child: Slider(
                          //     value: controller.height.toDouble(),
                          //     min: 0.0,
                          //     max: 20.0,
                          //     onChanged: (double newValue) {
                          //       controller.changeHeight(newValue);
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      // Expanded(
                      //   child: ReusableBg(
                      //     colour: kactiveCardColor,
                      //     cardChild: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           'WEIGHT',
                      //           style: klabelTextStyle,
                      //         ),
                      //         Text(
                      //           controller.weight.toString(),
                      //           style: kDigitTextStyle,
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             IconButton(
                      //                 onPressed: () {
                      //                   controller.decreaseWeight();
                      //                 },
                      //                 icon: const Icon(FontAwesomeIcons.minus,
                      //                     color: Colors.white54)),
                      //             const SizedBox(
                      //               width: 15.0,
                      //             ),
                      //             IconButton(
                      //               onPressed: () {
                      //                 controller.increaseWeight();
                      //               },
                      //               icon: const Icon(FontAwesomeIcons.plus,
                      //                   color: Colors.white54),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: ReusableCard(
                          colour: kactiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.age.toString(),
                                    style: kDigitTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'ft',
                                    style: klabelTextStyle,
                                  ),
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: ksliderInactiveColor,
                                  thumbColor: Color(0xFFEB1555),
                                  overlayColor: Color(0x29EB1555),
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 15.0),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 35.0),
                                ),
                                child: Slider(
                                  value: controller.feetToCm.toDouble(),
                                  min: 0.0,
                                  max: controller.feetToCm.toDouble(),
                                  onChanged: (double newValue) {
                                    controller.changeHeightFeetSlider(newValue);
                                    controller.update();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // BottomContainer(
                      //   text: 'CALCULATE',
                      //   onTap: () {
                      //     Calculate calc =
                      //         Calculate(height: height, weight: weight);

                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => ResultPage(
                      //           bmi: calc.result(),
                      //           resultText: calc.getText(),
                      //           advise: calc.getAdvise(),
                      //           textColor: calc.getTextColor(),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],

                    // floatingActionButton: FloatingActionButton(
                    //   onPressed: () {},
                    //   child: Icon(
                    //     Icons.favorite,
                    //     color: Colors.pink,
                    //     size: 23.0,
                    //   ),
                    //   backgroundColor: kactiveCardColor,
                    // ),
                  )),
                ]);
          }),
    );
  }
}
