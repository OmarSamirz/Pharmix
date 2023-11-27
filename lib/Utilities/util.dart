import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void goToScreen(BuildContext context, Widget chosenScreen,
    PageTransitionType pageTransition) {
  Navigator.of(context).push(
    PageTransition(child: chosenScreen, type: pageTransition),
  );
}
