import 'dart:async';
import 'package:flutter/material.dart';
import 'package:greenmark/core/styles/colors.dart';

class ResendTimer extends StatefulWidget {
  final int durationSeconds;
  final VoidCallback? onResend;

  const ResendTimer({super.key, this.durationSeconds = 83, this.onResend});

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  int secondsRemaining = 0;
  bool canResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    secondsRemaining = widget.durationSeconds;
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (secondsRemaining > 0) {
        setState(() => secondsRemaining--);
      } else {
        setState(() => canResend = true);
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String get timerText =>
      '${secondsRemaining ~/ 60}:${(secondsRemaining % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: canResend
          ? () {
              widget.onResend?.call();
              setState(() {
                secondsRemaining = widget.durationSeconds;
                canResend = false;
                timer = Timer.periodic(Duration(seconds: 1), (t) {
                  if (secondsRemaining > 0) {
                    setState(() => secondsRemaining--);
                  } else {
                    setState(() => canResend = true);
                    timer?.cancel();
                  }
                });
              });
            }
          : null,
      child: Text(
        canResend ? 'Resend OTP' : 'Resend confirmation code ($timerText)',
        style: TextStyle(
          color: canResend ? AppColors.tangocolor : AppColors.graycolor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}
