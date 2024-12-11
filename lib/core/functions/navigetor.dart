import 'package:flutter/material.dart';

//push
push(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screen,
  ));
}

//pushReplacement
pushReplacement(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => screen,
  ));
}

//pushAndRemoveUntil
pushAndRemoveUntil(BuildContext context, Widget screen) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}
