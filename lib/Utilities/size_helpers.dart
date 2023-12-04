
import 'package:flutter/material.dart';

Size fullDisplaySize(BuildContext context){
  return MediaQuery.of(context).size;
}

double screenWidthSize(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double screenHeightSize(BuildContext context){
  return MediaQuery.of(context).size.height;
}