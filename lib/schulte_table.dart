import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SchulteTable extends StatefulWidget {

  const SchulteTable({Key? key}) : super(key: key);

  @override
  State<SchulteTable> createState() => _SchulteTableState();
}

class _SchulteTableState extends State<SchulteTable> {
  // Schulte table parameters
  int currentNumber = 1;
  List<int> numbers = new List<int>.generate(3 * 3, (i) => i + 1);

  // Success animation parameters
  final int successAnimationDurationMs = 1000;
  final int colorSwitchTimeMs = 200;
  final List<Color> successColors = [Colors.green, Colors.redAccent, Colors.yellow];
  bool successAnimation = false;
  int currentSuccessColor = 0;

  // Start changing color for animation
  void startSucessAnimation() {
    Timer.periodic(Duration(milliseconds: colorSwitchTimeMs), (timer) {
      setState(() {
        currentSuccessColor = (currentSuccessColor + 1) % successColors.length;
      });

      if (timer.tick == successAnimationDurationMs / colorSwitchTimeMs) {
        timer.cancel();
      }
    });
  }

  // Restart the game and trigger animation
  void restartTheGame() {
    setState(() {
      successAnimation = true;
    });

    startSucessAnimation();

    Timer(Duration(milliseconds: successAnimationDurationMs), () {
      setState(() {
        successAnimation = false;
      });
      reset();
    });
  }

  // Reset only the game state
  void reset() {
    setState(() {
      currentNumber = 1;
      numbers.shuffle();
    });
  }

  @override
  initState() {
    super.initState();
    // Resetting the game to get shuffled numbers
    reset();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Sorry that it is taking that long. The loading is still in progress.",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 240,
            height: 240,
            child: GridView.count(
              crossAxisCount: sqrt(numbers.length).round(),
              children: List.generate(numbers.length, (index) {
                return InkWell(
                    onTap: () {
                      if (numbers[index] == currentNumber) {
                        setState(() {
                          currentNumber++;
                          if (currentNumber == numbers.length + 1) {
                            restartTheGame();
                          }
                        });
                      }
                    },
                    child: TableTile(index, context));
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Here is a Shulte table to train your attentiveness. Find numbers from 1 to 9",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
        ]));
  }

  // Table tile that displays number and performs animation
  AnimatedContainer TableTile(int index, BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
            color: successAnimation
                ? successColors[currentSuccessColor]
                : numbers[index] < currentNumber
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.background,
            border: Border.all(color: Theme.of(context).colorScheme.secondary)),
        child: Center(
          child: Text(numbers[index].toString(),
              style: Theme.of(context).textTheme.headlineMedium),
        ));
  }
}
