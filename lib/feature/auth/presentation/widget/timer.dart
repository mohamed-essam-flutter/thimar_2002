import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:t7mara/core/utils/colors.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 10,
      initialDuration: 0,
      controller: CountDownController(),
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 4,
      ringColor: ColorApp.white,
      ringGradient: null,
      fillColor: ColorApp.white,
      fillGradient: null,
      backgroundColor: ColorApp.white,
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(
          fontSize: 33.0, color: ColorApp.primary, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
      textFormat: CountdownTextFormat.S,
      isReverse: false,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: false,
      onStart: () {
        debugPrint('Countdown Started');
      },
      onComplete: () {
        debugPrint('Countdown Ended');
      },
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "Start";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
